//
//  HeroesMenuViewModel.swift
//  iOSAvanzadoPractica
//
//  Created by Rodrigo Latorre on 12/10/22.
//

import UIKit

class HeroesMenuViewModel {

    var coreData: CoreDataManager
    
    var characters: [Hero] = []
    
    init(coreData: CoreDataManager = CoreDataManager()) {
        self.coreData = coreData
    }
    
    func viewDidLoad() {
        self.getCharacters()
        print(characters)
    }
    
    func getCharacters() {
        characters = coreData.fetchHeroes().map({ $0.character })
    }
}

