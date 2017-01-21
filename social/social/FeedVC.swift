//
//  FeedVC.swift
//  social
//
//  Created by Jacob Landman on 1/20/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        
        KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        try! FIRAuth.auth()?.signOut()
        dismiss(animated: true, completion: nil)
    }
}
