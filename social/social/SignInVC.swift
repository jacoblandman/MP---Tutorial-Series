//
//  SignInVC.swift
//  social
//
//  Created by Jacob Landman on 1/20/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var pwdField: FancyField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        // authenticate with facebook
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("JACOB: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("JACOB: User cancelled Facebook authentication")
            } else {
                print("JACOB: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("JACOB: Unable to authenticate with Firebase - \(error)")
            } else {
                print("JACOB: Successfully authenticated with Firebase")
            }
        })
    }
    
    // need to look into the authenication errors
    // and account for all that could happen when trying to log in
    @IBAction func signInTapped(_ sender: Any) {
        
        guard let email = emailField.text, !email.isEmpty else {
            print("The email field needs to be populated")
            return
        }
        
        guard let pwd = pwdField.text, pwd.characters.count > 6 else {
            print("The password field needs to be populated with more than 6 characters")
            return
        }
        
        FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
            if error == nil {
                print("JACOB: Email user authenticated with Firebase")
            } else {
                // the user may not exist
                FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                    if error != nil {
                        print("JACOB: Unable to authenticate email login with Firebase")
                    } else {
                        print("JACOB: Successfully authenticated new email user with Firebase")
                    }
                })
            }
        })
    }
}

