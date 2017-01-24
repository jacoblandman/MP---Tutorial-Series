//
//  LoginVC.swift
//  spaceChat
//
//  Created by Jacob Landman on 1/23/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: RoundTextField!
    @IBOutlet weak var passwordField: RoundTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func loginPressed(_ sender: Any) {
        view.endEditing(true)
        
        guard let email = emailField.text, !email.isEmpty else {
            print("The email field needs to be populated")
            let ac = UIAlertController(title: "Email inValid", message: "You must enter a valid email", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(ac, animated: true)
            return
        }
        
        guard let pwd = passwordField.text, pwd.characters.count > 6 else {
            print("The password field needs to be populated with more than 6 characters")
            let ac = UIAlertController(title: "Password inValid", message: "You must enter a password longer than 6 characters", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(ac, animated: true)
            return
        }
        
        AuthService.instance.login(email: email, password: pwd) { (errMsg, data) in
            
            guard errMsg == nil else {
                let ac = UIAlertController(title: "Error Authentication", message: errMsg, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(ac, animated: true)
                return
            }
            
            self.dismiss(animated: true, completion: nil)
        }
    }
}
