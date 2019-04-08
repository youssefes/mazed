//
//  contact_Us.swift
//  mazad
//
//  Created by youssef on 4/3/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class contact_Us: UIViewController {

    @IBOutlet weak var massageTxt: UITextView!
    @IBOutlet weak var emailTxT: UITextField!
    @IBOutlet weak var contectUsBtn: UIButton!
    @IBOutlet weak var suggestBtn: UIButton!
    @IBOutlet weak var containerViewConta: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ballBtn(_ sender: Any) {
    }
    
    @IBAction func contectUsbtn(_ sender: UIButton) {
        self.contectUsBtn.backgroundColor = #colorLiteral(red: 0.9980325103, green: 0.5917010903, blue: 0.03312186524, alpha: 1)
        contectUsBtn.setTitleColor(.white, for: .selected)
        self.suggestBtn.setTitleColor(#colorLiteral(red: 0.8117647059, green: 0.8117647059, blue: 0.8117647059, alpha: 1), for: .normal)
        self.suggestBtn.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
        self.containerViewConta.isHidden = true
    }
    
    @IBAction func suggestBtn(_ sender: UIButton) {
        self.containerViewConta.isHidden = false
        self.suggestBtn.backgroundColor = #colorLiteral(red: 0.9980325103, green: 0.5917010903, blue: 0.03312186524, alpha: 1)
        suggestBtn.setTitleColor(.white, for: .selected)
        self.contectUsBtn.setTitleColor(#colorLiteral(red: 0.8117647059, green: 0.8117647059, blue: 0.8117647059, alpha: 1), for: .normal)
        self.contectUsBtn.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
    }
    
    
    @IBAction func sendmassage(_ sender: Any) {
        
        guard let email = emailTxT.text, !email.isEmpty, let message = massageTxt.text, !message.isEmpty else {
            return
        }
        API.Contect_us(email: email, message: message, isContect: true) { (status, message) in
            if status{
                guard let messageToShow = message else{
                    return
                }
                print(messageToShow)
                
                self.emailTxT.text = ""
                self.massageTxt.text = ""
            }
        }
        
    }
    @IBAction func callNow(_ sender: Any) {
        
    }
    
    
}
