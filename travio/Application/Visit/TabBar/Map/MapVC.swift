//
//  MapVC.swift
//  travio
//
//  Created by Şevval Çakıroğlu on 20.08.2023.
//

import UIKit
import MapKit
import SnapKit

class MapVC: UIViewController, MKMapViewDelegate {
    
    private lazy var mapView: MKMapView = {
        let map = MKMapView(frame: self.view.frame)
        self.view.addSubview(map)

        let rotation = CLLocationCoordinate2D(latitude: 41.0082, longitude: 28.9784)
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(getLocationLongPress))
        map.addGestureRecognizer(longPressGesture)
        
        let region = MKCoordinateRegion(center: rotation, latitudinalMeters: 1000, longitudinalMeters: 1000)
        map.setRegion(region, animated: true)
        map.delegate = self
        
        return map
        
    }()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    
        setupView()

    }
    
    @objc func getLocationLongPress(sender: UILongPressGestureRecognizer) /*-> CLLocationCoordinate2D*/{

        if sender.state == .began {
            let touchPoint = sender.location(in: mapView)
            let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            
            // Create a map annotation
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = coordinate
            annotation.title = "New Place"
            annotation.subtitle = "Description"
            
            // Add the annotation to the map view
            mapView.addAnnotation(annotation)
            
            let vc = AddNewPlaceVC()
            vc.preferredContentSize = CGSize(width: 390, height: 790)
            present(vc, animated: true, completion: nil)
            
            print("latitude: \(coordinate.latitude)", "longitude: \(coordinate.longitude)")
            
           
        }
        

        // return coordinate
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
