//
//  AlertController.swift
//  Bill Splitter
//
//  Created by JohnJoe Stack on 11/10/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import Foundation

import UIKit


struct AlertController {
    
 
    //when called you can create an alert box to your choosing
    func createAlert(title: String, message: String, options: [String]){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var viewController = appDelegate.currentViewController
        
        let myAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        for i in options{
            myAlert.addAction(UIAlertAction(title: i, style: UIAlertActionStyle.Default, handler: nil))
        }
        viewController!.presentViewController(myAlert, animated: true, completion: nil)
        
    }
    
    
}