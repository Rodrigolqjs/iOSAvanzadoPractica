
import Foundation
@testable import IOSAvanzadoPractica

class NetWorkModelSpy: NetworkModel {

    override func login(user: String, password: String, completion: ((String?, Error?) -> Void)? = nil) {
        if(user == "test@test.com") {
            completion?("TestToken", nil)
            return
        }

        completion?(nil, nil)
    }
}
