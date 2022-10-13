//
//  HeroesMenuViewController.swift
//  iOSAvanzadoPractica
//
//  Created by Rodrigo Latorre on 12/10/22.
//

import UIKit

protocol HeroesMenuViewControllerProtocol {
    
}

class HeroesMenuViewController: UIViewController {

    var viewModel: HeroesMenuModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension HeroesMenuViewController: HeroesMenuViewControllerProtocol {
    
}
