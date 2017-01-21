//
//  PostCell.swift
//  social
//
//  Created by Jacob Landman on 1/21/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(post: Post) {
        
        self.caption.text = post.caption
        self.likesLbl.text = "\(post.likes)"
        
        
    }
}