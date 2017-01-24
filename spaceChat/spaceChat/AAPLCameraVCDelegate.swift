//
//  AAPLCameraVCDelegate.swift
//  spaceChat
//
//  Created by Jacob Landman on 1/23/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import Foundation

protocol AAPLCameraVCDelegate {
    
    func shouldEnableCameraUI(_ enable: Bool)
    
    func shouldEnableRecordUI(_ enable: Bool)
    
    func recordingHasStarted()
    
    func canStartRecording()
    
    func videoRecordingComplete(videoURL: NSURL)
    
    func videoRecordingFailed()
    
    func snapshotTaken(snapshotData: NSData)
    
    func snapshotFailed()
    
}
