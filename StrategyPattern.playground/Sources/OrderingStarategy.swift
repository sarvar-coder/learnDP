import Foundation

public protocol OrderingStarategy {
    func fetch(handler: @escaping(Result<[OrderItem], Error>) -> Void)
}

public struct OrderItem {
    
    public let title: String    
}

