//
//  DetalheViewController.swift
//  RM35605
//
//  Created by Washington Alexandre Silva on 02/12/2017.
//  Copyright © 2017 Washington Alexandre Silva. All rights reserved.
//

import UIKit

class DetalheViewController: UIViewController {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbTagLine: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbAbv: UILabel!
    @IBOutlet weak var lbIbu: UILabel!
    @IBOutlet weak var ivImg: UIImageView!
    
    var cerveja: Cerveja!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = " "
        if cerveja != nil {
            lbName.text = cerveja.name
            lbTagLine.text = cerveja.tagline
            lbDescription.text = cerveja.description
            lbAbv.text = "\(cerveja.abv)"
            lbIbu.text = "\(cerveja.ibu)"
            if let url = URL(string: cerveja.img_url) {
                ivImg.kf.setImage(with: url)
            }
        }
    }


}
