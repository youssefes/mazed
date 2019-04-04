//
//  trachcell.swift
//  mazad
//
//  Created by youssef on 4/3/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class trachcell: UITableViewCell {

    @IBOutlet weak var imageVie: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var likbtn: UIButton!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var DeatailsBtn: UIButton!
    @IBOutlet weak var imageTrach: UIImageView!
    @IBOutlet weak var Datelbl: UILabel!
    @IBOutlet weak var timelbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
