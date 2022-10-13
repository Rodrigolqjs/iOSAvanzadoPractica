//
//  HeroesMenuViewModel.swift
//  iOSAvanzadoPractica
//
//  Created by Rodrigo Latorre on 12/10/22.
//

import UIKit

protocol HeroesMenuModelProtocol {
    
}

class HeroesMenuViewModel {

    var viewDelegate: HeroesMenuViewControllerProtocol?
    
    init(viewDelegate: HeroesMenuViewControllerProtocol) {
        self.viewDelegate = viewDelegate
    }
    
}

extension HeroesMenuViewModel: HeroesMenuModelProtocol {
    
}
