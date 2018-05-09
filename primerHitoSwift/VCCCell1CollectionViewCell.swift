//
//  VCCCell1CollectionViewCell.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 24/4/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class VCCCell1CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgCollectionCoche: UIImageView!
    
    @IBOutlet weak var lblMarca: UILabel!
    
    @IBOutlet weak var lblModelo: UILabel!
    
    func descargarFoto(url:String){
        
        let UIImg = DataHolder.sharedInstance.arrayFotos[url]
        
        if UIImg != nil {
            
            //let image = UIImg
            self.imgCollectionCoche.image = UIImg
            print("primer if")
            
        } else {
            print("primer else")
            let islandRef = DataHolder.sharedInstance.storageRef?.child(url)
            islandRef?.getData(maxSize: 1 * 1024 * 1024) { data, error in
                self.imgCollectionCoche?.image = nil
                if let error = error {
                    print("segundo if")
                    // Uh-oh, an error occurred!
                    print(error)
                } else {
                    print("segundo else")
                    let image = UIImage(data: data!)
                    self.imgCollectionCoche.image = image
                    
                }
                DataHolder.sharedInstance.arrayFotos[url] = self.imgCollectionCoche.image
            }
            
        }
        
        
    }
    
}
