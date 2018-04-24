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
    
    func initFireBase() {
        
        FirebaseApp.configure()
        
        fireStoreDB = Firestore.firestore()
        
        storage = Storage.storage()
        
        storageRef = storage?.reference()
        
        fireStoreDB?.collection("coches").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    
                    self.arrayMarcas.append((document.get("Marca") as? String)!)
                    self.arrayFotos.append((document.get("Foto") as? String)!)
                    print(self.arrayMarcas)
                    print("\(document.documentID) => \(document.data())")
                    
                }
            }
        }
        
    }
    
}
