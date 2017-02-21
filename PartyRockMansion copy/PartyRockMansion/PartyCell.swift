//
//  PartyCell.swift
//  PartyRockMansion
//
//  Created by Jacob Landman on 1/11/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit

import UIKit

class PartyCell: UITableViewCell {
    
    
    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func updateUI(partyRock: PartyRock ) {
        videoTitle.text = partyRock.videoTitle
        //TODO:  Set Image from url
    }
    
}
