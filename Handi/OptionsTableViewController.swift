//
//  OptionsTableViewController.swift
//  Bill Splitter
//
//  Created by JohnJoe Stack on 29/09/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import UIKit

class OptionsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    
    var inAppPurchaseSection = 0
    var sections = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        print("called view did load")
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.optionsTableViewController = self
         sections = 3
        if appDelegate.inAppPurchases[AvailablePurchases.RemoveAds]!{
            removeAdsPurchased(false)
            print("removing ads")
        }
       
        
        
    }

    
    @IBOutlet weak var myTableView: UITableView!
    
    func removeAdsPurchased(firstTime: Bool){
        print("removing stuff tableView")
        print("old sections")
        print(sections)
        sections = sections - 1
        print("new sections")
        print(sections)
        inAppPurchaseSection = inAppPurchaseSection - 1
        if firstTime == true{
            print("first time")
            myTableView!.reloadData()
        }
    }
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print("printing sections")
        print(sections)
        return sections
        
    }

     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == inAppPurchaseSection{
            return 2
        }else{
            return 1
        }
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("called")
        print(indexPath.section)
        if indexPath.section == inAppPurchaseSection + 1{
            
            
            
            var tempCell = tableView.dequeueReusableCellWithIdentifier("rateOurAppCell", forIndexPath: indexPath)
            tempCell.selected = false
            
            let appReviewLink = "//itunes.apple.com/app/id1033311922"
            let url = NSURL(string: "itms-apps:\(appReviewLink)")
            UIApplication.sharedApplication().openURL(url!)
            
            
            
        }else if indexPath.section == inAppPurchaseSection + 2{
            print("section 3")
            
            var tempCell = tableView.dequeueReusableCellWithIdentifier("getSupportCell", forIndexPath: indexPath)
            
            
            var mailHandler = SendMailHandler()
            self.addChildViewController(mailHandler)
            
            let subject: String? = "Support: Split My Bill"
            let body: String? = nil
            let recipients: [String]? = ["support@f-stack.com"]
            
            mailHandler.launchEmail(subject, emailBody: body, emailRecipients: recipients)
            tempCell.selected = false

            
        }
        
    }
    
    
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("tableview bit")
        //print(indexPath.row)
        
        print("row:")
        
        print(indexPath.row)
        print("sections: " )
        print(sections)
        
        var cell: UITableViewCell
        
        
        if indexPath.section == inAppPurchaseSection{
            print("section 0")
            if indexPath.row == 0{
                
            
            cell = tableView.dequeueReusableCellWithIdentifier("disableAdvertsCell", forIndexPath: indexPath)
            }else{
                cell = tableView.dequeueReusableCellWithIdentifier("restorePurchasesCell", forIndexPath: indexPath)
            }
            
            
        }else if indexPath.section == inAppPurchaseSection + 1{
            print("section 2")
            
            
            cell = tableView.dequeueReusableCellWithIdentifier("rateOurAppCell", forIndexPath: indexPath)
        }
            
        else if indexPath.section == inAppPurchaseSection + 2{
            print("section 3")
            
            
            cell = tableView.dequeueReusableCellWithIdentifier("getSupportCell", forIndexPath: indexPath)


        }else{
        cell = tableView.dequeueReusableCellWithIdentifier("getSupportCell", forIndexPath: indexPath)
        }
        
        // Configure the cell...
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.currentViewController = segue.destinationViewController
    }


}
