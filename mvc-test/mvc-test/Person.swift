//
//  File.swift
//  mvc-test
//
//  Created by Jacob Landman on 1/11/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import Foundation

class Person {
    private var _firstName: String!
    private var _lastName: String!
    
    var firstName: String {
        get {
           return _firstName
        }
        
        set {
            _firstName = newValue
        }
        
    }
    
    var lastName: String {
        get {
            return _lastName
        }
        
        set {
            _lastName = newValue
        }
        
    }
    
    init(first: String, last: String) {
        self._firstName = first
        self._lastName = last
    }
    
    var fullName: String {
        return "\(_firstName!) \(_lastName!)"
    }
    
}
