//
//  VCRegister.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 5/4/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class VCRegister: UIViewController {

    @IBOutlet weak var txtFieldEmail: UITextField!
    
    @IBOutlet weak var txtFieldUser: UITextField!
    
    @IBOutlet weak var txtFieldPssw: UITextField!
    
    @IBOutlet weak var txtFieldPsswAgn: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var btnOk: UIButton!
    @IBAction func btnGo(){
        print(DataHolder.sharedInstance.sNick
        )
        
            Auth.auth().createUser(withEmail: (txtFieldEmail?.text)!, password: (txtFieldPssw?.text)!) { (user, error) in
                
                if error == nil{
                    
                    DataHolder.sharedInstance.actualUser = user
                    
                    
                    DataHolder.sharedInstance.fireStoreDB?.collection("perfiles").document((user?.uid)!).setData([
                        "user": (self.txtFieldUser?.text)!,
                        "edad": 23,
                        "coche": "coches/" + "jSGzn9bKB1updWoHvINw"
                    ]) { err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        } else {
                            print("Document added with ID: \(String(describing: user?.uid))")
                        }
                    }
                    
                    self.performSegue(withIdentifier: "trRegisterOk", sender: self)
                    
                }
                else {
                    print("Error! ", error!)
                }
            }
        
        
               
    }
    
}
