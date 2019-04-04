//
//  NotificationCell.swift
//  mazad
//
//  Created by youssef on 4/1/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {
    @IBOutlet weak var pricelbl: UILabel!
    
    @IBOutlet weak var ViewOFImage: UIView!
    @IBOutlet weak var ViewContainer: UIView!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var imagecare: UIImageView!
    @IBOutlet weak var mozudelbl: UILabel!
    @IBOutlet weak var timelbl: UILabel!
    @IBOutlet weak var dateTime: UILabel!
    @IBOutlet weak var likebtn: UIButton!
    @IBOutlet weak var timeONView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
