//
//  Extension.swift
//  mazad
//
//  Created by youssef on 4/5/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class ImageCuircl : UIImageView{
    @IBInspectable var corner_Reduis : CGFloat = 0.0 {
        didSet{
            layer.cornerRadius = corner_Reduis
            layer.masksToBounds = true
        }
    }
}
