
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
    
    func test_signIn_and_saveToken() {
        let keyChainTest = KeychainSwift()
        sut = LoginViewModel(network: NetWorkModelSpy(), keyChain: keyChainTest)
        sut.signIn(email: "test@test.com", password: "test") {}
        
        let token = keyChainTest.get("TestToken")
        
        XCTAssertEqual(token, "testToken")
        
    }
    
    func test_saveHeroes() {
        var coreData = CoreDataManager()
        sut.saveHeroes()
        
        let characters = coreData.fetchHeroes()
        XCTAssertEqual(characters, <#T##expression2: Equatable##Equatable#>)
    }

    
}
