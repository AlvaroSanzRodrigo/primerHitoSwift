//
//  VCItem1Table.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 5/4/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import FirebaseFirestore

class VCItem1Table: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
   
    
    @IBOutlet weak var miTabla: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DataHolder.sharedInstance.arrayMarcas.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let miCelda1 = tableView.dequeueReusableCell(withIdentifier: "miCelda1") as! TVCMiCelda1
        miCelda1.miLabel.text? = DataHolder.sharedInstance.arrayMarcas[indexPath.row]
        let islandRef = DataHolder.sharedInstance.storageRef?.child(DataHolder.sharedInstance.arrayFotos[indexPath.row])
        islandRef?.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
                print(error)
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                miCelda1.imgCoche.image = image
            }
        }
        print(print(DataHolder.sharedInstance.arrayFotos))
        return miCelda1
    }

}
