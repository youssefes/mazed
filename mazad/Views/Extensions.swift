//
//  Extensions.swift
//  mazad
//
//  Created by youssef on 4/1/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    
    func roundCorners(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    func applyShadow() {
        self.layer.shadowOpacity = 0.5
        self.layer.cornerRadius = 4.0
        self.layer.shadowRadius = 4.0
        self.layer.shadowOffset = CGSize(width: 1, height: 3)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.50).cgColor
        self.clipsToBounds = false
    }
    
    @IBInspectable var borderwidth : CGFloat {
        
        set(newvalue){
            
            layer.borderWidth = newvalue
            
        }
        get{
            
            return layer.borderWidth
            
        }
        
    }
    
    
    @IBInspectable var bordercolor : UIColor {
        
        
        set(newvalue){
            
            
            layer.borderColor = newvalue.cgColor
        }
        get {
            
            return UIColor.black
        }
        
        
    }
    
}
