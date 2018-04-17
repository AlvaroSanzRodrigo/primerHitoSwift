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

class VCRegister: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    
   

    @IBOutlet weak var txtFieldEmail: UITextField!
    
    @IBOutlet weak var txtFieldUser: UITextField!
    
    @IBOutlet weak var txtFieldPssw: UITextField!
    
    @IBOutlet weak var txtFieldPsswAgn: UITextField!
    

    
    var selectedCar:String!
    
    @IBOutlet weak var myPicker: UIPickerView!
   
    
    
    var pickerData: [String] = ["McLaren", "BMW"]
       
    
    
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
            
            Auth.auth().createUser(withEmail: (txtFieldEmail?.text)!, password: (txtFieldPssw?.text)!) { (user, error) in
                
                if error == nil{
                    
                    DataHolder.sharedInstance.miPerfil.iEdad = 23
                    DataHolder.sharedInstance.miPerfil.sNombreUsuario = self.txtFieldUser?.text
                    DataHolder.sharedInstance.miPerfil.sCoche = self.selectedCar
                    DataHolder.sharedInstance.fireStoreDB?.collection("perfiles").document((user?.uid)!).setData(DataHolder.sharedInstance.miPerfil.getMap()) { err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        } else {
                            print("Document added with ID: \(String(describing: user?.uid))")
                        }
                    }
                    
                    
                    if user != nil {
                        let refPerfil = DataHolder.sharedInstance.fireStoreDB?.collection("perfiles").document((user?.uid)!)
                        refPerfil?.getDocument(completion: { (document, errordoc) in
                            if document != nil {
                                
                                DataHolder.sharedInstance.miPerfil.setMap(valores: (document?.data())!)
                                print(DataHolder.sharedInstance.miPerfil.sNombreUsuario!, DataHolder.sharedInstance.miPerfil.iEdad!, DataHolder.sharedInstance.miPerfil.sCoche! )
                                self.performSegue(withIdentifier: "trRegisterOk", sender: self)
                            }else{
                                print(error!)
                            }
                        })
                        
                    } else{
                        print(error!)
                    }
                    
                    
                    
                    
                }
                else {
                    print("Error! ", error!)
                }
            }
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
