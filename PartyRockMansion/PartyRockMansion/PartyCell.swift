//
//  PartyCell.swift
//  PartyRockMansion
//
//  Created by Jacob Landman on 1/11/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle

        // set the image
        // when downloading from internet, put on asynchronous thread
        let url = URL(string: partyRock.imageURL)!
        
        // async is a background thread
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                // sync is the main thread
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                // handle the error
            }
        }
        
    }

}
