//
//  ViewController.swift
//  primerHitoSwift
//
//  Created by Alvaro Sanz Rodrigo on 22/03/2018.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

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
        if loginUserTxtField?.text == "SanzCopacabana" && loginPsswTxtField?.text == "jahbless23"{
            self.performSegue(withIdentifier: "trLoginIsCorrect", sender: self)
        }
        
    }
}
