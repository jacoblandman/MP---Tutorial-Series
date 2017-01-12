//
//  RoundedImageView.swift
//  mvc-test
//
//  Created by Jacob Landman on 1/11/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }

}
