//
//  MyAcutions.swift
//  mazad
//
//  Created by youssef on 4/4/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class MyAcutions: UITableViewCell {

    @IBOutlet weak var deletBTn: UIButton!
    @IBOutlet weak var editBTN: UIButton!
    @IBOutlet weak var reSharebtn: UIButton!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var imagead: UIImageView!
    @IBOutlet weak var timelbl: UILabel!
    @IBOutlet weak var DateLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
