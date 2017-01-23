//
//  CameraVC.swift
//  spaceChat
//
//  Created by Jacob Landman on 1/23/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit

class CameraVC: CameraViewController {

    @IBOutlet weak var previewView: PreviewView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var cameraUnavailableLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var resumeButton: UIButton!
    
    override func viewDidLoad() {
        _previewView = previewView
        _cameraButton = cameraButton
        _cameraUnavailableLabel = cameraUnavailableLabel
        _recordButton = recordButton
        _resumeButton = resumeButton
        
        super.viewDidLoad()
    }
    
    @IBAction func recordBtnPressed(_ sender: Any) {
        //toggleToMovie()
        toggleMovieRecording()
    }
    
    @IBAction func changeCameraBtnPressed(_ sender: Any) {
        changeCamera()
    }
}

