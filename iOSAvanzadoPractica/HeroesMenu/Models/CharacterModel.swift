//
//  CharacterModel.swift
//  iOSAvanzadoPractica
//
//  Created by Rodrigo Latorre on 24/10/22.
//

import Foundation

struct Hero: Decodable {
    let photo: URL
    let id: String
    let favorite: Bool
    let name: String
    let description: String
    var latitude: Double
    var longitude: Double
}

struct HeroCoordenates: Decodable {
    let latitude: String
    let longitud: String
    let id: String
}
