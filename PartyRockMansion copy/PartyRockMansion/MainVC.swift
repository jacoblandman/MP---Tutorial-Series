//
//  ViewController.swift
//  PartyRockMansion
//
//  Created by Jacob Landman on 1/11/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let p1 = PartyRock(imageURL: "http://orig13.deviantart.net/94e3/f/2008/014/c/f/cool_green_reason_by_rhesusmonkey.jpg", videoURL: "https://www.youtube.com/watch?v=fgduNn9HuI0",
                           videoTitle: "Aint Talkin")
        
        
        
        
        partyRocks.append(p1)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:
            "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock:  partyRock)
            
            return cell
            
        } else {
            
            return UITableViewCell()
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "VideoVC", sender: nil)
    }
    
}
