//
//  CameraVC.swift
//  spaceChat
//
//  Created by Jacob Landman on 1/23/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit

class CameraVC: CameraViewController, AAPLCameraVCDelegate {

    @IBOutlet weak var previewView: PreviewView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var cameraUnavailableLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var resumeButton: UIButton!
    
    override func viewDidLoad() {
        
        delegate = self
        
        _previewView = previewView
        _cameraUnavailableLabel = cameraUnavailableLabel
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
    
    func shouldEnableCameraUI(_ enable: Bool) {
        print("Should enable camera UI: \(enable)")
        cameraButton.isEnabled = enable
    }
    
    func shouldEnableRecordUI(_ enable: Bool) {
        print("Should enable record UI: \(enable)")
        recordButton.isEnabled = enable
    }
    
    func recordingHasStarted() {
        print("Recording has started")
    }
    
    func canStartRecording() {
        print("Can start recording")
    }
}

