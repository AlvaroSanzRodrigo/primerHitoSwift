//
//  VCCollection.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 24/4/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import FirebaseStorage

class VCCollection: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataHolder.sharedInstance.arrayModelos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let miCuadrao = collectionView.dequeueReusableCell(withReuseIdentifier: "miCuadrao", for: indexPath) as! VCCCell1CollectionViewCell
        miCuadrao.lblModelo.text? = DataHolder.sharedInstance.arrayModelos[indexPath.row]
        miCuadrao.lblMarca.text? = DataHolder.sharedInstance.arrayMarcas[indexPath.row]
        let islandRef = DataHolder.sharedInstance.storageRef?.child(DataHolder.sharedInstance.arrayFotos[indexPath.row])
        islandRef?.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
                print(error)
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                miCuadrao.imgCollectionCoche.image = image
            }
        }
        return miCuadrao
    }
    

    @IBOutlet weak var collectionCoches: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
