//
//  AuthService.swift
//  spaceChat
//
//  Created by Jacob Landman on 1/23/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (_ errMsg: String?, _ data: AnyObject?) -> Void

class AuthService {
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String, password: String, onComplete: Completion?) {
        print("JACOB: About to attempt to log in with username and password")
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: error!._code) {
                    if errorCode == .errorCodeUserNotFound {
                        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                                print("JACOB: Could not create user, error: \(error.debugDescription)")
                            } else {
                                print("JACOB: Creating new user")
                                if user?.uid != nil {
                                    print("JACOB: The user uid is not nil")
                                    DataService.instance.saveUser(uid: user!.uid)
                                    // Sign in
                                    FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil {
                                            self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                                            print("JACOB: Could not sign in user, error: \(error.debugDescription)")
                                        } else {
                                            onComplete?(nil, user)
                                            print("JACOB: SUCCESSFULLY MADE NEW USER AND LOGGED IN")
                                        }
                                    })
                                } else {
                                    print("JACOB: The user uid is nil")
                                }
                            }
                        })
                    } else {
                        // Handle all other errors
                        print("JACOB: Could not sign in user, error: \(error.debugDescription)")
                        self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                    }
                }
            } else {
                onComplete?(nil, user)
                print("JACOB: SUCCESSFULLY LOGGED IN PREVIOUS USER")
            }
        })
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        print(error.debugDescription)
        if let errorCode = FIRAuthErrorCode(rawValue: error._code) {
            switch (errorCode) {
            case .errorCodeInvalidEmail:
                onComplete?("Invalid email address", nil)
                break
                
            case .errorCodeWrongPassword:
                onComplete?("Invalid password", nil)
                break
                
            case .errorCodeEmailAlreadyInUse, .errorCodeAccountExistsWithDifferentCredential:
                onComplete?("Could not create account. Email already in use", nil)
                break
                
            default:
                onComplete?("There was a problem authenticating. Try again", nil)
                
            }
        }
    }
    
}
