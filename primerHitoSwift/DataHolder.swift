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
    
    var actualUser:User?
    
    var userData:DocumentSnapshot?
    
    func initFireBase() {
        
        FirebaseApp.configure()
        
        fireStoreDB = Firestore.firestore()
        
    }
    
}
