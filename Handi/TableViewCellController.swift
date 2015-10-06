//
//  TableViewCellController.swift
//  Bill Splitter
//
//  Created by JohnJoe Stack on 06/10/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import UIKit

class TableViewCellController: UITableViewCell {

    @IBOutlet weak var disableAdvertsSwitch: UISwitch!
    
    var purchaseHandler = PurchaseHandler(productID: "com.f_stack.billsplitter.remove_ads")
    
    @IBAction func disableAdvertsSwitchSwitched(sender: AnyObject) {
        
        print("switched")
        
        if disableAdvertsSwitch.on == true{
            
            purchaseHandler.requestProductInfo()
            //problem is have not waited for request to come back, so i am going to have to multi thread.
            
            
            
        }
        
        
        
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("table view cell inited")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    
    
    
    
    
    
}
