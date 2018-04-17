//
//  Perfiles.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 17/4/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class Perfiles: NSObject {
    
    var iEdad:Int?
    
    var sNombreUsuario:String?
    
    var sCoche:String?
    
    
    func setMap(valores:[String:Any]){
        iEdad = valores["edad"] as? Int
        
        sNombreUsuario = valores["user"] as? String
        
        sCoche = valores["coche"] as? String
    }
    
    func getMap() -> [String:Any] {
        
        var mapTemp:[String:Any] = [:]
        
        mapTemp["edad"] = iEdad as Any
        
        mapTemp["user"] = sNombreUsuario as Any
        
        mapTemp["coche"] = sCoche as Any
        
        return mapTemp
    }
    
}


