import UIKit

var greeting = "Hello, playground"

/// Object using a strategy pattern
/// Strategy protocol  involves methods and properties that strategy must  implents
/// Strategy conforms to protocol --- kinda behavior

public class Cheff {
    
   public var order: OrderingStarategy!
    
   public init(order: OrderingStarategy) {
        self.order = order
    }
    
//    func fetch() {
//        order.fetch { result in
//            switch result {
//            case .success(let success): break
//            
//            case .failure(let failure): break
//            }
//        }
//    }
}  

let nusret = Cheff(order: TodaysMealClient())
