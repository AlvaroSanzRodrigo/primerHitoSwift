//
//  VCMapa.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 19/4/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

import MapKit
import CoreLocation
class VCMapa: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var miMapa:MKMapView?
    var locationManager:CLLocationManager?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        miMapa?.showsUserLocation = true
        self.agregarPin(titulo: "prueba", latitud: 42, longitud: -3)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let miSpan:MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        
        let tempRegion:MKCoordinateRegion = MKCoordinateRegion(center: locations[0].coordinate, span: miSpan)
        //miMapa?.setRegion(tempRegion, animated: true)
        
    }
    
    func agregarPin(titulo title:String, latitud lat:Double, longitud lon:Double) {
        let annotation:MKPointAnnotation = MKPointAnnotation()
        annotation.title = title
        annotation.coordinate.latitude = lat
        annotation.coordinate.longitude = lon
        miMapa?.addAnnotation(annotation)
    }

}
