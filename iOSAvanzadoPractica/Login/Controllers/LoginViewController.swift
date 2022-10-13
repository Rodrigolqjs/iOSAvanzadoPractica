//
//  LoginViewController.swift
//  iOSAvanzadoPractica
//
//  Created by Rodrigo Latorre on 12/10/22.
//

import UIKit

protocol LoginViewControllerProtocol {
    func navigateToMenu()
}

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    var viewModel: LoginViewModelProtocol? = LoginViewModel(network: NetworkModel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onLoginTap(_ sender: Any) {
        
        emailTextField.text = "rodrigo.latorre@outlook.com"
        passwordTextField.text = "rlq12345"
        
        guard let email = emailTextField.text,
              let password = passwordTextField.text
        else {
            emailTextField.text = "rodrigo.latorre@outlook.com"
            passwordTextField.text = "rlq12345"
            return
        }
        
        viewModel?.onLoginButtonTap(email: email, password: password, completion: { token in
            self.viewModel?.saveToken(token: token)
            let token = self.viewModel?.getToken()
            self.viewModel?.navigateToHeroesMenu()
        })
    }
}

extension LoginViewController: LoginViewControllerProtocol {
    func navigateToMenu() {
        let nextSB = UIStoryboard(name: "HeroesMenu", bundle: nil)
        guard let nextVC = nextSB.instantiateInitialViewController() as? HeroesMenuViewController else { return }
        nextVC.viewModel = HeroesMenuViewModel(viewDelegate: nextVC)
        DispatchQueue.main.async {
            self.navigationController?.setViewControllers([nextVC], animated: true)
        }
    }
}
