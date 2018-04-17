//
//  VCItem1Table.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 5/4/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import FirebaseFirestore

class VCItem1Table: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
   
    
    @IBOutlet weak var miTabla: UITableView!
    
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DataHolder.sharedInstance.arrayMarcas.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let miCelda1 = tableView.dequeueReusableCell(withIdentifier: "miCelda1") as! TVCMiCelda1
        miCelda1.miLabel.text? = DataHolder.sharedInstance.arrayMarcas.popLast()!
        print("<- antes - cuando haces esto? - despues ->")
        return miCelda1
    }
    

}
