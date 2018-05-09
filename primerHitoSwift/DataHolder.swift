//
//  DataHolder.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 10/4/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import Firebase
import MapKit

class DataHolder: NSObject{
    
    
    
    static let sharedInstance:DataHolder = DataHolder();
    
    var fireStoreDB:Firestore?

    var storage:Storage?
    
    var storageRef:StorageReference?
    
    var sNick:String = "Sanz"
    
    var miPerfil:Perfiles = Perfiles ()
    
    var coches:[Coches] = []
    
    var arrayFotos:[String:UIImage] = [:]
    
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
    
    func regitro(delegate:DataHolderDelegate, txtFieldEmail:String, txtFieldPssw:String, txtFieldUser:String, selectedCar:String) {
        var allNice:Bool = false
        
        Auth.auth().createUser(withEmail: (txtFieldEmail), password: (txtFieldPssw)) { (user, error) in
            
            if error == nil{
                
                DataHolder.sharedInstance.miPerfil.iEdad = 23
                DataHolder.sharedInstance.miPerfil.sNombreUsuario = txtFieldUser
                DataHolder.sharedInstance.miPerfil.sCoche = selectedCar
                DataHolder.sharedInstance.fireStoreDB?.collection("perfiles").document((user?.uid)!).setData(DataHolder.sharedInstance.miPerfil.getMap()) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(String(describing: user?.uid))")
                    }
                }
                
                
                if user != nil {
                    
                    allNice = true
                    
                    let refPerfil = DataHolder.sharedInstance.fireStoreDB?.collection("perfiles").document((user?.uid)!)
                    refPerfil?.getDocument(completion: { (document, errordoc) in
                        if document != nil {
                            
                            DataHolder.sharedInstance.miPerfil.setMap(valores: (document?.data())!)
                            print(DataHolder.sharedInstance.miPerfil.sNombreUsuario!, DataHolder.sharedInstance.miPerfil.iEdad!, DataHolder.sharedInstance.miPerfil.sCoche! )
                            delegate.DHDregistro(allnice: allNice)
                            
                        }else{
                            print(error!)
                        }
                    })
                    
                } else{
                    print(error!)
                }
                
                
                
                
            }
            else {
                print("Error! ", error!)
            }
        }
    }
    
    func agregarPin(delegate:DataHolderDelegate ,titulo title:String, latitud lat:Double, longitud lon:Double) {
        let annotation:MKPointAnnotation = MKPointAnnotation()
        annotation.title = title
        annotation.coordinate.latitude = lat
        annotation.coordinate.longitude = lon
        delegate.DHDagregarPin(annotation: annotation)
        
    }
}

@objc protocol DataHolderDelegate{
    @objc func DHDdescargaCochesComplete(allnice: Bool)
    @objc func DHDregistro(allnice: Bool)
    @objc func DHDagregarPin(annotation:MKPointAnnotation)
}
