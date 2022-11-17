
import Foundation
@testable import IOSAvanzadoPractica

class NetWorkModelSpy: NetworkModel {

    override func login(user: String, password: String, completion: ((String?, Error?) -> Void)? = nil) {
        print("login")
        if(user == "test@test.com") {
            print(user)
            print("entro")
            completion?("testToken", nil)
            return
        }

        print("salio")
        completion?(nil, nil)
    }
}
