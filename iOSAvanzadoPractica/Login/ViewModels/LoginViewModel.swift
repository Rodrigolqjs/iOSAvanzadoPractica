
import Foundation

protocol LoginViewModelProtocol {
    func onViewsLoaded(email: String, password: String)
    func onLoginButtonTap(email: String, password: String, completion: @escaping (_ token: String) -> Void)
    func navigateToHeroesMenu()
    func saveToken(token: String)
    func getToken() -> String
}

class LoginViewModel {
    
    let network: NetworkModel?
    var viewDelegate: LoginViewControllerProtocol?
    var keyChain: KeyChainHelper
    private let service = "DragonBall"
    private let account = "Rodrigo"
    
    init(network: NetworkModel?, keyChain: KeyChainHelper = KeyChainHelper.standar) {
        self.network = network ?? NetworkModel()
        self.keyChain = keyChain
    }
    
    
    func signIn(email: String, password: String, completion: @escaping (_ token: String) -> Void) {
        network?.login(user: email, password: password) { token, error in
            completion(token ?? "")
        }
    }
    

    
    func navigateToNextSB() {
        viewDelegate?.navigateToMenu()
    }
}

extension LoginViewModel: LoginViewModelProtocol {
    func onViewsLoaded(email: String, password: String) {

    }
    
    func onLoginButtonTap(email: String, password: String, completion: @escaping (_ token: String) -> Void) {
        signIn(email: email, password: password, completion: completion)
    }
    
    func navigateToHeroesMenu() {
        navigateToNextSB()
    }
    
    func saveToken(token: String) {
        let data = Data(token.utf8)
        keyChain.save(data: data, service: service, account: account)
    }
    
    func getToken() -> String {
        let data = keyChain.read(service: service, account: account)
        let token = String(decoding: data ?? Data(), as: UTF8.self)
        return token
    }
}
