//
//  CustomcellTableViewCell.swift
//  TurboApplication
//
//  Created by BibiX  on 11/03/2016.
//  Copyright © 2016 BibiX . All rights reserved.
//

import UIKit

class CustomcellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var turboImage: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
