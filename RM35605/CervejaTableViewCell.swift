//
//  CervejaTableViewCell.swift
//  RM35605
//
//  Created by Washington Alexandre Silva on 02/12/2017.
//  Copyright © 2017 Washington Alexandre Silva. All rights reserved.
//

import UIKit

class CervejaTableViewCell: UITableViewCell {

    @IBOutlet weak var ivImg: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAbv: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
