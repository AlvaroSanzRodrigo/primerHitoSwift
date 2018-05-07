//
//  TVCMiCelda1.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 5/4/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import FirebaseFirestore

class TVCMiCelda1: UITableViewCell {

    @IBOutlet weak var miLabel: UILabel!
    @IBOutlet weak var imgCoche: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func descargarFoto(url:String){
        let islandRef = DataHolder.sharedInstance.storageRef?.child(url)
        islandRef?.getData(maxSize: 1 * 1024 * 1024) { data, error in
            self.imgCoche?.image = nil
            if let error = error {
                // Uh-oh, an error occurred!
                print(error)
            } else {
                let image = UIImage(data: data!)
                self.imgCoche.image = image
            }
        }
    }

}
