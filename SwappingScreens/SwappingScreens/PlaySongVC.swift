//
//  PlaySongVC.swift
//  SwappingScreens
//
//  Created by Jacob Landman on 1/10/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit

class PlaySongVC: UIViewController {

    private var _selectedSong: String!
    
    var selectedSong: String {
        get {
            return _selectedSong
        } set {
            _selectedSong = newValue
        }
    }
    
    @IBOutlet weak var songTitleLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        songTitleLbl.text = _selectedSong
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
