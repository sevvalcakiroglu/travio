//
//  MapVC.swift
//  travio
//
//  Created by Şevval Çakıroğlu on 20.08.2023.
//

import UIKit
import MapKit
import SnapKit

class MapVC: UIViewController {
    
    private lazy var mapView: MKMapView = {
        let map = MKMapView(frame: self.view.frame)
        self.view.addSubview(map)

        let rotation = CLLocationCoordinate2D(latitude: 41.0082, longitude: 28.9784)
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(getLocationLongPress))
        map.addGestureRecognizer(longPressGesture)
        
        let region = MKCoordinateRegion(center: rotation, latitudinalMeters: 1000, longitudinalMeters: 1000)
        map.setRegion(region, animated: true)
        
        return map
        
    }()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    
        setupView()

    }
    
    @objc func getLocationLongPress(){
        
        
    }
    
    func setupView(){
        view.addSubview(mapView)
        
        setupLayout()
    }
    
    
    func setupLayout(){
        
        mapView.snp.makeConstraints({make in
            make.edges.equalToSuperview()
        })
        
    }
}
