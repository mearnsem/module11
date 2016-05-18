//
//  ViewController.swift
//  PowerNapTimer
//
//  Created by James Pacheco on 4/12/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TimerDelegate {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    let timer = Timer()
    private let localNotificationTag = "timerNotification"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        resetTimer()
        timer.delegate = self
    }
    
    func setView() {
        updateTimerLabel()
        // If timer is running, start button title should say "Cancel". If timer is not running, title should say "Start nap"
        if timer.isOn {
            startButton.setTitle("Cancel", forState: .Normal)
        } else {
            startButton.setTitle("Start nap", forState: .Normal)
        }
    }
    
    func updateTimerLabel() {
        timerLabel.text = timer.timeAsString()
    }
    
    @IBAction func startButtonTapped(sender: AnyObject) {
        if timer.isOn {
            timer.stopTimer()
        } else {
            timer.startTimer(15)
            scheduleLocalNotification()
        }
        setView()
    }
    
    func scheduleLocalNotification() {
        guard let timerTime = timer.timeRemaining else {
            return
        }
        let notification = UILocalNotification()
        notification.fireDate = NSDate(timeIntervalSinceNow: timerTime)
        notification.alertTitle = "Time's Up"
        notification.alertBody = "Time to get up"
        notification.category = localNotificationTag
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func cancelLocalNotifications() {
        guard let localNotifications = UIApplication.sharedApplication().scheduledLocalNotifications else {
            return
        }
        let timerLocalNotifications = localNotifications.filter({$0.category == localNotificationTag})
        for notification in timerLocalNotifications {
            UIApplication.sharedApplication().cancelLocalNotification(notification)
        }
    }
    
    func resetTimer() {
        guard let localNotifications = UIApplication.sharedApplication().scheduledLocalNotifications else {
            return
        }
        let timerLocalNotifications = localNotifications.filter({$0.category == localNotificationTag})
        guard let timerNotification = timerLocalNotifications.last,
            fireDate = timerNotification.fireDate else {
                return
        }
        timer.stopTimer()
        timer.startTimer(fireDate.timeIntervalSinceNow)
    }
    
    func timerSecondTick() {
        updateTimerLabel()
    }
    
    func timerCompleted() {
        let alertController = UIAlertController(title: "Get up!", message: "Time to move around", preferredStyle: .Alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .Default) { (_) in
            self.setView()
        }
        alertController.addAction(dismissAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    //MARK: - TimerDelegate Methods
    
    func timerStopped() {
        setView()
        cancelLocalNotifications()
    }
    
    
    
    
    
}

