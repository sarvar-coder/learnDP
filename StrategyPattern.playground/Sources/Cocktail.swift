import Foundation


public class CocktailClient: OrderingStarategy {
    
    public init() { }
    
    public func fetch<Response: Codable>(handler: @escaping (Result<Response, Error>) -> Void) {
        
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/random.php") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else { return }
                
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

public struct Cocktail: Codable {
    public let drinks: [Drink]
    
    public init(drinks: [Drink]) {
        self.drinks = drinks
    }
}

public struct Drink: Codable {
    public let strDrink: String
    
    public init(strDrink: String) {
        self.strDrink = strDrink
    }
}
