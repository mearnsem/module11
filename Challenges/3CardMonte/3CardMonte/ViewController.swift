//
//  ViewController.swift
//  3CardMonte
//
//  Created by Emily Mearns on 5/16/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        let alertController = UIAlertController(title: "3 Card Monte", message: "Pick a card. Find the queen!", preferredStyle: .Alert)
        
        let firstAction = UIAlertAction(title: "Card One", style: .Default) { alert -> Void in self.youLose() }
        
        let secondAction = UIAlertAction(title: "Card Two", style: .Destructive) { alert -> Void in self.youLose() }
        
        let thirdAction = UIAlertAction(title: "Card Three", style: .Cancel) { alert -> Void in self.youWin() }
            
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        alertController.addAction(thirdAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func youLose() {
        let alertController = UIAlertController(title: "You Lose...", message: "Play again!", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "No thanks", style: .Default) { alert -> Void in print("No") }
        let cancelAction = UIAlertAction(title: "Yes", style: .Cancel) { cancelAlert -> Void in self.viewDidAppear(true) }
        
        alertController.addAction(cancelAction)
        alertController.addAction(defaultAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func youWin() {
        let alertController = UIAlertController(title: "You Win!!!", message: "Play again!", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "No thanks", style: .Default) { alert -> Void in print("No") }
        let cancelAction = UIAlertAction(title: "Yes", style: .Cancel) { cancelAlert -> Void in self.viewDidAppear(true) }
        
        alertController.addAction(cancelAction)
        alertController.addAction(defaultAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }


}

