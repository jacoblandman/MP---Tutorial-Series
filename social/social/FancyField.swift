//
//  FancyField.swift
//  social
//
//  Created by Jacob Landman on 1/20/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit

class FancyField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.2).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 2.0
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        // this impacts the place holder text
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        // this impacts the location of the editing text
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
}
