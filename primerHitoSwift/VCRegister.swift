//
//  VCRegister.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 5/4/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import FirebaseAuth

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
                    
                    self.performSegue(withIdentifier: "trRegisterOk", sender: self)
                    
                }
                else {
                    print("Error! ", error!)
                }
            }
        
        
               
    }
    
}
