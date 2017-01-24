//
//  CameraVC.swift
//  spaceChat
//
//  Created by Jacob Landman on 1/23/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit
import FirebaseAuth

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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //performSegue(withIdentifier: "LoginVC", sender: nil)
        guard FIRAuth.auth()?.currentUser != nil else {
            // load login vc
            performSegue(withIdentifier: "LoginVC", sender: nil)
            return
        }
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
    
    func videoRecordingFailed() {
        print("The Video Recording failed")
    }
    
    func videoRecordingComplete(videoURL: NSURL) {
        print("")
        performSegue(withIdentifier: "UsersVC", sender: ["videoURL": videoURL])
        
    }
    
    func snapshotFailed() {
        print("The photo snapshot failed")
    }
    
    func snapshotTaken(snapshotData: NSData) {
        print("A snapshot has been taken")
        performSegue(withIdentifier: "UsersVC", sender: ["snapshotData": snapshotData])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let usersVC = segue.destination as? UsersVC {
            if let videoDict = sender as? Dictionary<String, URL> {
                let url = videoDict["videoURL"]
                usersVC.videoURL = url
            } else {
                if let snapDict = sender as? Dictionary<String, Data> {
                    let snapData = snapDict["snapshotData"]
                    usersVC.snapData = snapData
                }
            }
        }
    }
}

