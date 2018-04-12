//
//  ViewController.swift
//  primerHitoSwift
//
//  Created by Alvaro Sanz Rodrigo on 22/03/2018.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {
    
    let refCoches = DataHolder.sharedInstance.fireStoreDB?.collection("coches")

    @IBOutlet weak var loginUserTxtField: UITextField?
    
    @IBOutlet weak var loginPsswTxtField: UITextField?
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnOk(_ sender: UIButton) {
        print("Esto funciona")
        Auth.auth().signIn(withEmail: (loginUserTxtField?.text)!, password: (loginPsswTxtField?.text)!) { (user, error) in
            if user != nil {
                DataHolder.sharedInstance.actualUser = user
                let refPerfil = DataHolder.sharedInstance.fireStoreDB?.collection("perfiles").document((user?.uid)!)
                refPerfil?.getDocument(completion: { (document, errordoc) in
                    if document != nil {
                        print(document?.data()! as Any)
                        DataHolder.sharedInstance.userData? = document!
                        
                    }else{
                        print(error!)
                    }
                })
                self.performSegue(withIdentifier: "trLoginIsCorrect", sender: self)
            } else{
                print(error!)
            }
        }
    }
}
