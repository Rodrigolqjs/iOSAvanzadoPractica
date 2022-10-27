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
    
    let viewModel = MapViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(loadHeroMap),
            name: Notification.Name("loadMap"),
            object: nil
        )
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
            latitude: mapView.userLocation.coordinate.latitude,
            longitude: mapView.userLocation.coordinate.longitude
        )
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
