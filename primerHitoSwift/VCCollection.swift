//
//  VCCollection.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 24/4/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import FirebaseStorage
import MapKit

class VCCollection: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, DataHolderDelegate {
    func DHDdescargaCochesComplete(allnice: Bool) {
        if allnice {
            print("allnice: \(allnice)" )
            collectionCoches.reloadData()
        }
        
    }
    
    func DHDregistro(allnice: Bool) {
        
    }
    
    func DHDagregarPin(annotation: MKPointAnnotation) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("hola")
        return DataHolder.sharedInstance.coches.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let miCuadrao = collectionView.dequeueReusableCell(withReuseIdentifier: "miCuadrao", for: indexPath) as! VCCCell1CollectionViewCell
        miCuadrao.lblModelo.text? = "hola"
        miCuadrao.lblMarca.text? = DataHolder.sharedInstance.coches[indexPath.row].marca!
        miCuadrao.descargarFoto(url: DataHolder.sharedInstance.coches[indexPath.row].foto!)
        return miCuadrao
    }
    

    @IBOutlet weak var collectionCoches: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if DataHolder.sharedInstance.coches.isEmpty {
            DataHolder.sharedInstance.descargarCoches(delegate: self)
        } else{print("Collection else descargarcoches")}
        
        
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
