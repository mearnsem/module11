//
//  ViewController.swift
//  Alert
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
        let alertController = UIAlertController(title: "Alert!", message: "This is an alert.", preferredStyle: .Alert)
        
        let destructiveAction = UIAlertAction(title: "Warning!", style: .Destructive) { alert -> Void in
            print("Something blew up") }
        
        let defaultAction = UIAlertAction(title: "Cancel", style: .Cancel) { alert -> Void in
            print("Boring") }
        
        let okAction = UIAlertAction(title: "Ok", style: .Default) { action -> Void in
            print("Okaley Dokaley") }
        
        alertController.addAction(okAction)
        alertController.addAction(destructiveAction)
        alertController.addAction(defaultAction)
        
        
        self.presentViewController(alertController, animated: true, completion: nil)

    }
}


