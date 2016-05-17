//
//  ViewController.swift
//  Reminder
//
//  Created by Emily Mearns on 5/16/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var reminderTextLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.localNotificationFired), name: "Notification", object: nil)
    }

    @IBAction func scheduleButton(sender: AnyObject) {
        let notification = UILocalNotification()
        notification.alertBody = reminderTextLabel.text
        notification.fireDate = NSDate().dateByAddingTimeInterval(10)
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func localNotificationFired() {
        let alertController = UIAlertController(title: "Reminder", message: reminderTextLabel.text, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Okay", style: .Default, handler: nil)
        let action1 = UIAlertAction(title: "Remind me in 5 min", style: .Default, handler: nil)
        alertController.addAction(action)
        alertController.addAction(action1)
        
        presentViewController(alertController, animated: true, completion: nil)
    }

}

