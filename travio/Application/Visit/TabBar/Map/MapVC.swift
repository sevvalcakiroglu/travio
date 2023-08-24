//
//  MapVC.swift
//  travio
//
//  Created by Şevval Çakıroğlu on 20.08.2023.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let harita = MKMapView(frame: self.view.frame)
        self.view.addSubview(harita)

        let konum = CLLocationCoordinate2D(latitude: 41.0082, longitude: 28.9784)
        let bolge = MKCoordinateRegion(center: konum, latitudinalMeters: 1000, longitudinalMeters: 1000)
        harita.setRegion(bolge, animated: true)
    }
}
