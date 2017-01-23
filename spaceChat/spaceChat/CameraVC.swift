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
    @IBOutlet weak var captureModeControl: UISegmentedControl!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var cameraUnavailableLabel: UILabel!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var resumeButton: UIButton!
    
    override func viewDidLoad() {
        self._previewView = previewView
        self._captureModeControl = captureModeControl
        self._cameraButton = cameraButton
        self._cameraUnavailableLabel = cameraUnavailableLabel
        self._photoButton = photoButton
        self._recordButton = recordButton
        self._resumeButton = resumeButton
        
        super.viewDidLoad()
    }
}

