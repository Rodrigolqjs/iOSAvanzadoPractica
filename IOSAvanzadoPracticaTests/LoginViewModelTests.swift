
import XCTest
import KeychainSwift
@testable import IOSAvanzadoPractica

final class LoginViewModelTests: XCTestCase {

    var sut: LoginViewModel!
    
    override func setUpWithError() throws {
        sut = LoginViewModel(network: NetworkModel())
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_signIn() {
        let keyChainTest = KeychainSwift()
        sut = LoginViewModel(network: NetWorkModelSpy(), keyChain: keyChainTest)
        sut.signIn(email: "test@test.com", password: "test") {}
        
        let token = keyChainTest.get("TestToken")
        
        XCTAssertEqual(token, "TestToken")
        
    }
    
//    func saveHeroesTest() {
//
//    }
//
//    func saveTokenTest() {
//
//    }
    
}
