//
//  VCItem1Table.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 5/4/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import FirebaseFirestore

class VCItem1Table: UIViewController, UITableViewDelegate, UITableViewDataSource, DataHolderDelegate{
    func DHDregistro(allnice: Bool) {
        
        
    }
    
    func DHDdescargaCochesComplete(allnice: Bool) {
        if allnice {
            print("allnice: \(allnice)" )
            self.miTabla.reloadData()
        }
    }
    

    @IBOutlet weak var miTabla: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.descargarCoches(delegate: self)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(DataHolder.sharedInstance.coches.count)
        return DataHolder.sharedInstance.coches.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let miCelda1 = tableView.dequeueReusableCell(withIdentifier: "miCelda1") as! TVCMiCelda1
        miCelda1.miLabel.text? = DataHolder.sharedInstance.coches[indexPath.row].modelo!
        miCelda1.descargarFoto(url: DataHolder.sharedInstance.coches[indexPath.row].foto!)
        return miCelda1
    }
}
