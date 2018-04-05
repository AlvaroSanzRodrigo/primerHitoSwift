//
//  VCItem1Table.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 5/4/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit

class VCItem1Table: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var miTabla: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let miCelda1 = tableView.dequeueReusableCell(withIdentifier: "miCelda1") as! TVCMiCelda1
        
        if indexPath.row == 0{
            miCelda1.miLabel?.text = "Sanz"
        } else if indexPath.row == 1 {
            miCelda1.miLabel?.text = "Pablo"
        }else if indexPath.row == 2 {
            miCelda1.miLabel?.text = "Yony"
        }else if indexPath.row == 3 {
            miCelda1.miLabel?.text = "Joaquin"
        }
        return miCelda1
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
