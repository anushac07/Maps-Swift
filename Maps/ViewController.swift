//
//  ViewController.swift
//  Maps
//
//  Created by C Anusha on 11/15/1398 AP.
//  Copyright © 1398 C Anusha. All rights reserved.
//

import UIKit
import MapKit


class CustomPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D)
    {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}

class ViewController: UIViewController, MKMapViewDelegate {
    
    var coreLocationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    
    
    @IBOutlet weak var locs: UILabel!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //self.locs.text = "UVCE"
        
        let location = CLLocationCoordinate2D(latitude: 32.3235, longitude: 76.3242)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        self.mapView.setRegion(region, animated: true)
        
        let pin = CustomPin(title: "UVCE", subtitle: "KR Circle", coordinate: location)
        self.mapView.addAnnotation(pin)
        self.mapView.delegate = self
        
    }
    
    func mapView (_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
        annotationView.image = UIImage(named: "img")
        annotationView.canShowCallout = true
        return annotationView
    }

   
}

