//
//  CVCuserPics.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 22/5/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class CVCuserPics: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("datosFotosUsuarios: ", DataHolder.sharedInstance.datosFotosUsuarios.count)
        return DataHolder.sharedInstance.datosFotosUsuarios.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let miCuadrao = collectionView.dequeueReusableCell(withReuseIdentifier: "cellUserPic", for: indexPath) as! CVCCellusuariofotos
        miCuadrao.descargarFoto(url: DataHolder.sharedInstance.datosFotosUsuarios[indexPath.row].path!)
        return miCuadrao
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.descargarDatosFotosUsuario()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var variableGenial: UICollectionView!
    
    func descargarDatosFotosUsuario(){
        
        DataHolder.sharedInstance.fireStoreDB?.collection("fotos").getDocuments() { (querySnapshot, err) in
            if let err = err {
                
                print("Error getting documents: \(err)")
            } else {
                
                for document in querySnapshot!.documents {
                    
                    let c = fotosUsuarios()
                    c.setMap(valores: document.data())
                    DataHolder.sharedInstance.datosFotosUsuarios.append(c)
                    }
                self.variableGenial.reloadData()
            
        }
    }

    }
    
}
