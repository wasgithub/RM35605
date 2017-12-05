//
//  Cerveja.swift
//  RM35605
//
//  Created by Washington Alexandre Silva on 02/12/2017.
//  Copyright © 2017 Washington Alexandre Silva. All rights reserved.
//

import Foundation

class Cerveja {
    
    var id: Int
    var name: String
    var tagline: String
    var abv: Double
    var ibu: Double
    var description: String
    var img_url: String
    
    init(id: Int, name: String, tagline: String, abv: Double, ibu: Double, description: String, img_url: String) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.abv = abv
        self.ibu = ibu
        self.description = description
        self.img_url = img_url
    }
    
}
