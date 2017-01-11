//
//  PartyRock.swift
//  PartyRockMansion
//
//  Created by Jacob Landman on 1/11/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import Foundation


class PartyRock {
    // private variables set during initialization
    private var _imageURL: String!
    private var _videoURL: String!
    private var _videoTitle: String!
    
    // getters for the private variables
    var imageURL: String {
        return _imageURL
    }
    
    var videoURL: String {
        return _videoURL
    }
    
    var videoTitle: String {
        return _videoTitle
    }
    
    init(imageURL: String, videoURL: String, videoTitle: String) {
        
        _imageURL = imageURL
        _videoURL = videoURL
        _videoTitle = videoTitle
    }
    
}
