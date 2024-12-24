import Foundation

public class TodaysMealClient: OrderingStarategy {
    
    public init() { }

    public func fetch(handler: @escaping (Result<[OrderItem], Error>) -> Void) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/random.php")
        else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error {
                    handler(.failure(error))
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200
   
                else { return }
                
               guard let data = data else { return }
                
                do {
                    let result = try JSONDecoder().decode(Recipe.self, from: data)
                    let items = result.meals.map { OrderItem(title: $0.strMeal) }
                    handler(.success(items))
                } catch {
                    handler(.failure(error))
                }
            }
        }.resume()
    }
}

public struct Recipe: Codable {
    
    public let meals: [Meal]
}

public struct Meal: Codable {
    
    public let strMeal: String
}
