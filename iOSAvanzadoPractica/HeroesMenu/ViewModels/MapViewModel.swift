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
    var heroes: [Hero] = []
    var annotationsForMap: [MKPointAnnotation] = []

    func getHeroesById(hero: Hero) -> Hero {
        guard let heroRequested = self.coreData.fetchHero(for: hero.id) else { return hero }
        return heroRequested.character
    }

    func fetchForMap() {
        annotationsForMap = []
        for hero in heroes {
            let annotations = MKPointAnnotation()
            annotations.title = hero.name
            guard let latitude = hero.latitude,
                  let longitude = hero.longitude
            else { return }
            annotations.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            annotationsForMap.append(annotations)
        }

        NotificationCenter.default.post(name: Notification.Name("loadMap"), object: nil)
    }

    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
        } else {
            // Show popUp to notify user
        }
    }

    private func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus {
        default:
            break
        }
    }
}
