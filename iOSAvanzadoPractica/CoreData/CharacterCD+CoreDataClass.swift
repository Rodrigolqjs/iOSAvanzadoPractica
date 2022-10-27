//
//  CharacterCD+CoreDataClass.swift
//  iOSAvanzadoPractica
//
//  Created by Rodrigo Latorre on 24/10/22.
//
//

import Foundation
import CoreData

@objc(CharacterCD)
public class CharacterCD: NSManagedObject {

}

extension CharacterCD {
    static func createCharacterCD(from hero: Hero, context: NSManagedObjectContext) -> CharacterCD {
        let characterCD = CharacterCD(context: context)
        characterCD.id = hero.id
        characterCD.name = hero.name
        characterCD.favorite = hero.favorite
        characterCD.desc = hero.description
        characterCD.photo = hero.photo
        characterCD.longitude = hero.longitude ?? 0.0
        characterCD.latitude = hero.latitude ?? 0.0
        
        return characterCD
    }
    
    var character: Hero {
        Hero(
            photo: self.photo,
            id: self.id,
            favorite: self.favorite,
            name: self.name,
            description: self.desc,
            latitude: self.latitude,
            longitude: self.longitude
        )
    }
}
