//
//  DataHolder.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 10/4/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import Firebase

class DataHolder: NSObject {
    
    
    
    static let sharedInstance:DataHolder = DataHolder();
    
    var fireStoreDB:Firestore?

    var storage:Storage?
    
    var storageRef:StorageReference?
    
    var sNick:String = "Sanz"
    
    var miPerfil:Perfiles = Perfiles ()
    
    var arrayMarcas:[String] = []
    
    var arrayFotos:[String] = []
    
    var arrayModelos:[String] = []
    
    var arrayLatitud:[Double] = []
    
    var arrayLongitud:[Double] = []
    
    func initFireBase() {
        
        FirebaseApp.configure()
        
        fireStoreDB = Firestore.firestore()
        
        storage = Storage.storage()
        
        storageRef = storage?.reference()
    }
    
    func descargarCoches(delegate: DataHolderDelegate){
            var allNice:Bool = false
                fireStoreDB?.collection("coches").getDocuments() { (querySnapshot, err) in
            if let err = err {
                delegate.DHDdescargaCochesComplete(allnice: true)
                print("Error getting documents: \(err)")
            } else {
                delegate.DHDdescargaCochesComplete(allnice: true)
                for document in querySnapshot!.documents {
                    
                    self.arrayMarcas.append((document.get("Marca") as? String)!)
                    self.arrayFotos.append((document.get("Foto") as? String)!)
                    self.arrayModelos.append((document.get("Modelo") as? String)!)
                    self.arrayLatitud.append((document.get("Lat") as? Double)!)
                    self.arrayLongitud.append((document.get("Lon") as? Double)!)
                    print(self.arrayMarcas)
                    print("\(document.documentID) => \(document.data())")
                    
                }
                
            }
            
        }
    }
}

@objc protocol DataHolderDelegate{
    @objc func DHDdescargaCochesComplete(allnice: Bool)
}
