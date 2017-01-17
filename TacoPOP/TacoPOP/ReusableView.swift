//
//  ReusableView.swift
//  TacoPOP
//
//  Created by Jacob Landman on 1/17/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit

protocol  ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
