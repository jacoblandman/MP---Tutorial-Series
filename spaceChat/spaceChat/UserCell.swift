//
//  UserCell.swift
//  spaceChat
//
//  Created by Jacob Landman on 1/24/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var firstNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setCheckMark(selected: false)
    }
    
    func updateUI(user: User) {
        firstNameLbl.text = user.firstName
    }
    
    func setCheckMark(selected: Bool) {
        let imageStr = selected ? "messageindicatorchecked1" : "messageindicator1"
        self.accessoryView = UIImageView(image: UIImage(named: imageStr))
    }

}
