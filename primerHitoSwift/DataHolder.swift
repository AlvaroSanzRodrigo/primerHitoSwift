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
    
    var sNick:String = "Sanz"
    
    var miPerfil:Perfiles = Perfiles ()
    
    var arrayMarcas:[String] = []
    
    func initFireBase() {
        
        FirebaseApp.configure()
        
        fireStoreDB = Firestore.firestore()
        
        fireStoreDB?.collection("coches").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    
                    self.arrayMarcas.append((document.get("Marca") as? String)!)
                    
                    print(self.arrayMarcas)
                    print("\(document.documentID) => \(document.data())")
                    
                }
            }
        }
        
    }
    
}
