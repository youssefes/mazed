//
//  Register.swift
//  mazad
//
//  Created by youssef on 4/4/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class Register: UIViewController {

    @IBOutlet weak var countryKey: UITextField!
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var textName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        let TapregognizerIm = UITapGestureRecognizer(target: self, action: #selector(showAllImageToChose))
        TapregognizerIm.numberOfTapsRequired = 1
        self.imageProfile.addGestureRecognizer(TapregognizerIm)
        self.imageProfile.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        
        handelData()
    }
    
    @objc func showAllImageToChose(_ sender : UITapGestureRecognizer){
        
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }
    
    func handelData() {
        guard let email = email.text, !email.isEmpty, let phone = phone.text, !phone.isEmpty, let name = textName.text, !name.isEmpty, let password = password.text ,!password.isEmpty , let confirm_pass = confirmPassword.text, !confirm_pass.isEmpty, let countryKey = countryKey.text, !countryKey.isEmpty else{
            return
        }
        
        if password == confirm_pass {
           
            let image = imageProfile.image
            let adtaImage = image?.jpegData(compressionQuality: 1)
            
            API.Register(CountryKey:countryKey , Email: email, Password: password, UserName: name, PhoneNumber: phone, img:adtaImage) { (status) in
                if status{
                    print("done")
                }
            }
        }else{
            
        }
        
        
       
    }
    
    
    
}
extension  Register :UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[.originalImage] as? UIImage{
            self.imageProfile.image = image
        }else{
            if let imageEdit = info[.editedImage] as? UIImage{
                 self.imageProfile.image = imageEdit
            }
        }
    }
    
}

