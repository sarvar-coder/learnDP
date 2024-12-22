import Foundation

public class TodaysMealClient: OrderingStarategy {
    
    public init() { }

    public func fetch<Response: Codable>(handler: @escaping (Result<Response, Error>) -> Void) {
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
                    let result = try JSONDecoder().decode(Response.self, from: data)
                    handler(.success(result))
                } catch {
                    handler(.failure(error))
                }
            }
        }.resume()
    }
}

public struct Recipe: Codable {
    
    public let meals: [Meal]
    
    public init(meals: [Meal]) {
        self.meals = meals
    }
}

public struct Meal: Codable {
    
    public let strMeal: String
    
    public init(strMeal: String) {
        self.strMeal = strMeal
    }
}
