import Foundation

public protocol OrderingStarategy {
    func fetch<Response: Codable>(handler: @escaping(Result<Response, Error>) -> Void)
}

