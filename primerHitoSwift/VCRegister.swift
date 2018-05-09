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
import MapKit

class VCRegister: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, DataHolderDelegate{
    func DHDagregarPin(annotation: MKPointAnnotation) {
        
    }
    
    func DHDdescargaCochesComplete(allnice: Bool) {
        
        
    }
    
    func DHDregistro(allnice: Bool) {
        if allnice {
            self.performSegue(withIdentifier: "trRegisterOk", sender: self)
        }
    }
    
    
    
    
   

    @IBOutlet weak var txtFieldEmail: UITextField!
    
    @IBOutlet weak var txtFieldUser: UITextField!
    
    @IBOutlet weak var txtFieldPssw: UITextField!
    
    @IBOutlet weak var txtFieldPsswAgn: UITextField!
    

    
    var selectedCar:String!
    
    @IBOutlet weak var myPicker: UIPickerView!
   
    
    
    var pickerData: [String] = ["McLaren P1", "BMW 318 IS", "Renault Clio"]
       
    
    
    let carComponent = 0
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: - Picker View Data Sources and Delegates
    
 
    
    func pickerView(_
        pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int
        ) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_
        pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int)
    {
        updateLabel()
    }
    
    //MARK: - Instance Methods
    func updateLabel(){
        
        let car = pickerData[myPicker.selectedRow(inComponent: carComponent)]
        if car.contains("McLaren") {
            selectedCar = "/coches/jSGzn9bKB1updWoHvINw"
        } else if car.contains("BMW"){
            selectedCar = "/coches/K0u5PFw34JmtcNxbvDXR"
        } else if car.contains("Renault"){
            selectedCar = "/coches/XcOIzv1JFe5NI6HYlOnk"
        }
        print(selectedCar)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPicker.selectRow(0, inComponent:carComponent, animated: false)
        updateLabel()
    }
    
    
    @IBOutlet weak var lblErrorMsg: UILabel!
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var btnOk: UIButton!
    @IBAction func btnGo(){
        
        if !(txtFieldUser.text?.isEmpty)! &&  !(txtFieldPssw.text?.isEmpty)! && !(txtFieldEmail.text?.isEmpty)! && !(txtFieldPsswAgn.text?.isEmpty)! && (txtFieldPsswAgn.text == txtFieldPssw.text){
            
            DataHolder.sharedInstance.regitro(delegate: self, txtFieldEmail: txtFieldEmail.text!, txtFieldPssw: txtFieldPssw.text!, txtFieldUser: txtFieldUser.text!, selectedCar: self.selectedCar)
        } else {
            if  (txtFieldUser.text?.isEmpty)! {
                lblErrorMsg.text = "Campo de usuario vacio!"
            } else if (txtFieldEmail.text?.isEmpty)!{
                lblErrorMsg.text = "Campo de Email vacio!"
            } else if (txtFieldPssw.text?.isEmpty)!{
                lblErrorMsg.text = "Campo de contraseña vacio!"
            } else if (txtFieldPsswAgn.text?.isEmpty)!{
                lblErrorMsg.text = "Campo de repetir contraseña vacio!"
            } else if (txtFieldPsswAgn.text != txtFieldPssw.text){
                lblErrorMsg.text = "Las contraseñas no coinciden!"
            }
        }
        
        
        
        
        
               
    }
    
   
    
}
