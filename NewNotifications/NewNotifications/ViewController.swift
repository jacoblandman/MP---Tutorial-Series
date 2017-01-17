//
//  ViewController.swift
//  NewNotifications
//
//  Created by Jacob Landman on 1/17/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. REQUEST PERMISSION
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            
            if granted {
                print("Notification access granted")
            } else {
                print(error!.localizedDescription)
            }
        }
    }
    
    @IBAction func notifyButtonTapped(_ sender: UIButton) {
        scheduleNotification(inSeconds: 5) { (success) in
            if success {
                print("Successfully scheduled notification")
            } else {
                print("Did not set notification")
            }
        }
    }
    
    func scheduleNotification(inSeconds: TimeInterval, completion: @escaping (_: Bool) -> ()) {
        
        // add an attachment
        let myImage = "rick_grimes"
        guard let imageUrl = Bundle.main.url(forResource: myImage, withExtension: "gif") else {
            completion(false)
            return
        }
        
        let attachment = try! UNNotificationAttachment(identifier: "myNotification", url: imageUrl, options: [:])
        
        let notif = UNMutableNotificationContent()
        
        // ONLY FOR EXTENSION
        notif.categoryIdentifier = "myNotificationCategory"
        
        notif.title = "New Notification"
        notif.subtitle = "These are great!"
        notif.body = "The new notification options in iOS 10 are what I've always dreamed of!"
        notif.attachments = [attachment]
        
        
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myNotification", content: notif, trigger: notifTrigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                print(error!.localizedDescription)
                completion(false)
            } else {
                completion(true)
            }
        }
    }
}

