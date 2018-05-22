//
//  CVCCellusuariofotos.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 22/5/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import Firebase

class CVCCellusuariofotos: UICollectionViewCell {
    
    @IBOutlet weak var imFotoUsuario: UIImageView!
    
    func descargarFoto(url:String){
        
        let UIImg = DataHolder.sharedInstance.arrayFotosUsuarios[url]
        
        if UIImg != nil {
            
            //let image = UIImg
            self.imFotoUsuario.image = UIImg
            
            
        } else {
            
            let islandRef = DataHolder.sharedInstance.storageRef?.child(url)
            islandRef?.getData(maxSize: 1 * 300 * 300) { data, error in
                self.imFotoUsuario?.image = nil
                if let error = error {
                    
                    // Uh-oh, an error occurred!
                    print(error)
                } else {
                    
                    let image = UIImage(data: data!)
                    self.imFotoUsuario.image = image
                    
                }
                DataHolder.sharedInstance.arrayFotosUsuarios[url] = self.imFotoUsuario.image
            }
            
        }
        
        
    }
}
