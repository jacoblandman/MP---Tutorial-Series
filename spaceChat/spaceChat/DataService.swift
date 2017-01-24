//
//  DataService.swift
//  spaceChat
//
//  Created by Jacob Landman on 1/23/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

let FIR_CHILD_USERS = "users"

class DataService {
    private static let _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    var mainRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    var usersRef: FIRDatabaseReference {
        return mainRef.child(FIR_CHILD_USERS)
    }
    
    var mainStorageRef: FIRStorageReference {
        return FIRStorage.storage().reference()
    }
    
    var imagesStorageRef: FIRStorageReference {
        return mainStorageRef.child("images")
    }
    
    var videoStorageRef: FIRStorageReference {
        return mainStorageRef.child("videos")
    }
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, AnyObject> = ["firstName": "" as AnyObject, "lastName": "" as AnyObject]
        mainRef.child(FIR_CHILD_USERS).child(uid).child("profile").setValue(profile)
    }
    
    func sendMediaPullRequest(senderUID: String, sendingTo: Dictionary<String,User>, mediaURL: URL, textSnipped: String? = nil) {
        
        var uids = [String]()
        for uid in sendingTo.keys {
            uids.append("\(uid)")
        }
        //let userIds = sendingTo.keys
        var pr: Dictionary<String,AnyObject> = ["mediaURL": mediaURL.absoluteString as AnyObject,
                                                "userID": senderUID as AnyObject,
                                                "openCount": 0 as AnyObject,
                                                "recipients": uids as AnyObject ]
        
        mainRef.child("pullRequests").childByAutoId().setValue(pr)
    }
    
}
