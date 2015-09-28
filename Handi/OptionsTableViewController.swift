//
//  SettingsTableViewController.swift
//  Bill Splitter
//
//  Created by JohnJoe Stack on 26/09/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import UIKit

class OptionsTableViewController: UIViewController, UITableViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("row touched")
        
    }
    
    
    
    
    func rateApp(){
    UIApplication.sharedApplication().openURL(NSURL(string : "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=\\()&onlyLatestVersion=true&pageNumber=0&sortOrdering=1)")!);
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
