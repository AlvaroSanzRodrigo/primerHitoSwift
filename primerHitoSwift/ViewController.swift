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
                let refPerfil = DataHolder.sharedInstance.fireStoreDB?.collection("perfiles").document((user?.uid)!)
                refPerfil?.getDocument(completion: { (document, errordoc) in
                    if document != nil {
                        
                        DataHolder.sharedInstance.miPerfil.setMap(valores: (document?.data())!)
                        print(DataHolder.sharedInstance.miPerfil.sNombreUsuario!, DataHolder.sharedInstance.miPerfil.iEdad!, DataHolder.sharedInstance.miPerfil.sCoche! )
                         self.performSegue(withIdentifier: "trLoginIsCorrect", sender: self)
                    }else{
                        print(error!)
                    }
                })
               
            } else{
                print(error!)
            }
        }
    }
}
