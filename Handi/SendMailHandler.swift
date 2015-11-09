//
//  SendMailHandler.swift
//  Bill Splitter
//
//  Created by JohnJoe Stack on 26/10/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import Foundation
import UIKit
import MessageUI
//credit: http://stackoverflow.com/a/25984329 although i have heavily modified this
class SendMailHandler: UIViewController, MFMailComposeViewControllerDelegate {
    
    func launchEmail(emailSubject: String?, emailBody: String?, emailRecipients: [String]?) {
        
        
        
        
        
        
        
        
        
        
        
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        //if values have been set then adds them to the email, otherwise leaves them empty
        if let subject = emailSubject{
            mc.setSubject(subject)
        }
        
        if let body = emailBody{
            mc.setMessageBody(body, isHTML: false)
        }
        
        if let recipients = emailRecipients{
            mc.setToRecipients(recipients)
        }
       
        
        
        
        self.presentViewController(mc, animated: true, completion: nil)
        //presents the email box thing
    }
    
    
    func mailComposeController(controller:MFMailComposeViewController, didFinishWithResult result:MFMailComposeResult, error:NSError?) {
        //these are called depending on what the user does with the email
        //i dont require the use of any of these
        switch result.rawValue {
        case MFMailComposeResultCancelled.rawValue:
            print("Mail cancelled")
        case MFMailComposeResultSaved.rawValue:
            print("Mail saved")
        case MFMailComposeResultSent.rawValue:
            print("Mail sent")
        case MFMailComposeResultFailed.rawValue:
            print("Mail sent failure: %@", [error!.localizedDescription])
        default:
            break
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}