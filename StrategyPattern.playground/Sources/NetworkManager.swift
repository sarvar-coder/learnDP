import Foundation

public class NetworkManager: OrderingStarategy {
    
    public init() { }
    
    public func fetch<Response>(handler: @escaping (Result<Response, Error>) -> Void) where Response : Decodable, Response : Encodable {
        
    }
}
