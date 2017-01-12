//
//  ViewController.swift
//  mvc-test
//
//  Created by Jacob Landman on 1/11/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var renameField: UITextField!
    @IBOutlet weak var fullName: UILabel!
    let person = Person(first: "Jacob", last: "Landman")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        fullName.text = person.fullName
        
    }
    
    @IBAction func renamePressed(_ sender: Any) {
        if let txt = renameField.text {
            person.firstName = txt
            fullName.text = person.fullName
        }
    }
}

