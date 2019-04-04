//
//  favoriteCell.swift
//  mazad
//
//  Created by youssef on 4/3/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class favoriteCell: UITableViewCell {

    @IBOutlet weak var ViewContainer: UIView!
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var detailsBtn: UIButton!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var imageFavoirt: UIImageView!
    @IBOutlet weak var Datelbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
