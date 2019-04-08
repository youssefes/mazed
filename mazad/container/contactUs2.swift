//
//  contactUs2.swift
//  mazad
//
//  Created by youssef on 4/4/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class contactUs2: UIViewController {
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var suggestTxt: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func sendNow(_ sender: UIButton) {
        guard let email = emailTxt.text, !email.isEmpty, let message = suggestTxt.text, !message.isEmpty else {
            return
        }
        API.Contect_us(email: email, message: message, isContect: true) { (status, message) in
            if status{
                guard let messageToShow = message else{
                    return
                }
                print(messageToShow)
                self.emailTxt.text = ""
                self.suggestTxt.text = ""
            }
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
