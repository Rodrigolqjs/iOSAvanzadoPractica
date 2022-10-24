//
//  LoginViewController.swift
//  iOSAvanzadoPractica
//
//  Created by Rodrigo Latorre on 12/10/22.
//

import UIKit
import KeychainSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    var viewModel: LoginViewModel = LoginViewModel(network: NetworkModel())
    var keyChain = KeychainSwift()
    
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
         
        viewModel.signIn(email: email, password: password, completion: { token in
            print(token)
            DispatchQueue.main.async {
                let nextSB = UIStoryboard(name: "HeroesMenu", bundle: nil)
                guard let nextVC = nextSB.instantiateInitialViewController() as? HeroesMenuViewController else { return print("no se pudo castear a HeroesMenuVC")}
                self.navigationController?.setViewControllers([nextVC], animated: true)
            }
        })
    }
}

