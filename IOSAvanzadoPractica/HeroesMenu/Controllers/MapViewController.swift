//
//  MapViewController.swift
//  iOSAvanzadoPractica
//
//  Created by Rodrigo Latorre on 25/10/22.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var characterID: String = ""
    let viewModel = MapViewModel()
    
//    init(characterID: String, viewModel: MapViewModel = MapViewModel()) {
//        self.viewModel = MapViewModel(characterID: characterID)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.characterID = characterID
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(loadHeroMap),
            name: Notification.Name("loadMap"),
            object: nil
        )
        
        viewModel.viewWillAppear()
        viewModel.checkLocationServices()
        setupMap()

    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    //MARK: Configurations Maps
    func setupMap() {
        mapView.showsUserLocation = true
        mapView.centerToLocation(location: CLLocation(
            latitude: 40.41,
            longitude: -3.702)
        )
    }

    @objc func loadHeroMap() {
        mapView.addAnnotations(viewModel.annotationsForMap)
    }
    
}


//Crear archivo de extension+mapview
extension MKMapView {
    func centerToLocation(location: CLLocation, regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius
        )

        self.setRegion(coordinateRegion, animated: true)
    }
}
