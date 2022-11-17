//
//  MapViewModel.swift
//  iOSAvanzadoPractica
//
//  Created by Rodrigo Latorre on 25/10/22.
//

import Foundation
import MapKit
import KeychainSwift

final class MapViewModel {

    //MARK: Constants
    private var network = NetworkModel()
    private let coreData = CoreDataManager()
    private let locationManager = CLLocationManager()
    private let keyChain = KeychainSwift()

    //MARK: Variable
    var characterID: String = ""
    var annotationsForMap: [MKPointAnnotation] = []
    
    func viewWillAppear() {
        let coreDataCharacter = coreData.fetchHero(for: characterID).map({ $0.character })
        guard let coreDataCharacter else { return }
            fetchForMap(character: coreDataCharacter)
            print(annotationsForMap)

    }
    
    func getHeroesById(hero: Hero) -> Hero {
        guard let heroRequested = self.coreData.fetchHero(for: hero.id) else { return hero }
        return heroRequested.character
    }
    
    func fetchForMap(character: Hero) {
        annotationsForMap = []
            let annotations = MKPointAnnotation()
            annotations.title = character.name
            guard let latitude = character.latitude,
                  let longitude = character.longitude
            else { return }
            annotations.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            annotationsForMap.append(annotations)

        NotificationCenter.default.post(name: Notification.Name("loadMap"), object: nil)
    }

//    func fetchForMap(charactersCD: [Hero]) {
//        annotationsForMap = []
//        for character in charactersCD {
//            let annotations = MKPointAnnotation()
//            annotations.title = character.name
//            guard let latitude = character.latitude,
//                  let longitude = character.longitude
//            else { return }
//            annotations.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//            annotationsForMap.append(annotations)
//        }
//
//        NotificationCenter.default.post(name: Notification.Name("loadMap"), object: nil)
//    }

    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            print("entro a locationServices")
            checkLocationAuthorization()
        } else {
            // Show popUp to notify user
            print("no entro a locationServices")
        }
    }

    private func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus {
        default:
            break
        }
    }
}
