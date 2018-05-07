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
    
    var coches:[Coches] = []
    
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
                self.fireStoreDB?.collection("coches").getDocuments() { (querySnapshot, err) in
            if let err = err {
                delegate.DHDdescargaCochesComplete(allnice: allNice)
                print("Error getting documents: \(err)")
            } else {
                
                for document in querySnapshot!.documents {
                    
                    let c = Coches ()
                    c.setMap(valores: document.data())
                    self.coches.append(c)
                    print("\(document.documentID) => \(document.data())")
                    print(self.coches)
                    
                }
                allNice = true
                delegate.DHDdescargaCochesComplete(allnice: allNice)
                
            }
            
        }
    }
}

@objc protocol DataHolderDelegate{
    @objc func DHDdescargaCochesComplete(allnice: Bool)
}
