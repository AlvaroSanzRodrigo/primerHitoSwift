//
//  fotosUsuarios.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 22/5/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class fotosUsuarios: NSObject {

    var path:String?
    
    var uploader:String?
    
    var url:String?
    
    func setMap(valores:[String:Any]) {
        
        path = valores["path"] as? String
        
        uploader = valores["uploader"] as? String
        
        url = valores["url"] as? String
    }
    
    func getMap() -> [String:Any] {
        var mapTemp:[String:Any] = [:]
        
        mapTemp["path"] = path as Any
        
        mapTemp["uploader"] = uploader as Any
        
        mapTemp["url"] = url as Any
        
        return mapTemp
    }
    
}
