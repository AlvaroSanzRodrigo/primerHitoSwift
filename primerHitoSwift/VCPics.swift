//
//  VCPics.swift
//  primerHitoSwift
//
//  Created by Álvaro Sanz Rodrigo on 9/5/18.
//  Copyright © 2018 Alvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import Photos
import FirebaseFirestore

class VCPics: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imagePicked: UIImageView!
    
    @IBAction func loadImageButtonTapped(sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imagePicked.contentMode = .scaleAspectFit
            imagePicked.image = pickedImage
            let iTimeMillis = Int((Date().timeIntervalSince1970 * 1000.0).rounded())
            let strPath:String = String(format: "imgenesDeUsuario/img_%d.jpg",iTimeMillis )
            
            let riversRef = DataHolder.sharedInstance.storageRef?.child(strPath)
            
            // Upload the file to the path "images/rivers.jpg"
            let uploadTask = riversRef?.putFile(from: info[UIImagePickerControllerImageURL] as! URL, metadata: nil) { metadata, error in
                if let error = error {
                    // Uh-oh, an error occurred!
                } else {
                    // Metadata contains file metadata such as size, content-type, and download URL.
                    let downloadURL = metadata!.downloadURL()
                    print("Parece que ha ido bien ", downloadURL!)
                }
            }
            
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}

