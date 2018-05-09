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
class VCMapa: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, DataHolderDelegate{
    func DHDagregarPin(annotation: MKPointAnnotation) {
        miMapa?.addAnnotation(annotation)
    }
    
    func DHDdescargaCochesComplete(allnice: Bool) {
        if allnice{
            for modelo in DataHolder.sharedInstance.coches {
                
                DataHolder.sharedInstance.agregarPin(delegate: self, titulo: modelo.modelo!, latitud: modelo.latitud!, longitud: modelo.longitud!)
            }
        }
        
    }
    
    func DHDregistro(allnice: Bool) {
        
        
    }
    
    
    

    @IBOutlet var miMapa:MKMapView?
    var locationManager:CLLocationManager?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if DataHolder.sharedInstance.coches.isEmpty {
            DataHolder.sharedInstance.descargarCoches(delegate: self)
        }
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        miMapa?.showsUserLocation = true
        for modelo in DataHolder.sharedInstance.coches {
            
            DataHolder.sharedInstance.agregarPin(delegate: self, titulo: modelo.modelo!, latitud: modelo.latitud!, longitud: modelo.longitud!)
        }
        
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
    
    

}
