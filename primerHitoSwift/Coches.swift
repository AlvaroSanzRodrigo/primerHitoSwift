//
//  Coches.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 7/5/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class Coches: NSObject {
    
    var marca:String?
    
    var modelo:String?
    
    var foto:String?
    
    var latitud:Double?
    
    var longitud:Double?
    
    func setMap(valores:[String:Any]){
        
        marca = valores["Marca"] as? String
        
        modelo = valores["Modelo"] as? String
        
        foto = valores["Foto"] as? String
        
        latitud = valores["Lat"] as? Double
        
        longitud = valores["Lon"] as? Double
        
    }
    
    func getMap() -> [String:Any] {
        var mapTemp:[String:Any] = [:]
        
        mapTemp["Marca"] = marca as Any
        
        mapTemp["Modelo"] = modelo as Any
        
        mapTemp["Foto"] =  foto as Any
        
        mapTemp["Lat"] = latitud as Any
        
        mapTemp["Lon"] = longitud as Any
        
        return  mapTemp
    }
    
    

}
