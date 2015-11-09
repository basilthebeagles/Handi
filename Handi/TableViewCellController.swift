//
//  TableViewCellController.swift
//  Bill Splitter
//
//  Created by JohnJoe Stack on 06/10/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import UIKit

class TableViewCellController: UITableViewCell {

    @IBOutlet weak var disableAdvertsSwitch: UISwitch! //references to IB switches
    
    @IBOutlet weak var restorePurchasesSwitch: UISwitch!
    
    var makePurchaseModel: MakePurchaseModel! //model for interacting in app purchases.
    
    //called when the disableAdverts switch has been switched
    @IBAction func disableAdvertsSwitchSwitched(sender: AnyObject) {
        
        if makePurchaseModel == nil{//if no model has been set construct a new one
            makePurchaseModel = MakePurchaseModel(purchaseHandlerType: PurchaseHandlerType.purchase, viewController: self)
        }
        
        //if the switch is on then attempt to purchase an IAP
        if disableAdvertsSwitch.on == true{
            
            
            makePurchaseModel!.getInAppPurchase(AvailablePurchases.RemoveAds)
            
            
        }
        
        
        
    }
    //called when restorePurchases switch has been switched
    @IBAction func restorePurchasesSwitchSwitched(sender: AnyObject) {
        
        if makePurchaseModel == nil{
            makePurchaseModel = MakePurchaseModel(purchaseHandlerType: PurchaseHandlerType.restorePurchases, viewController: self)
        }
        
        if restorePurchasesSwitch.on == true{
            
            //attempts to restore purchases
            makePurchaseModel!.getInAppPurchase(nil)
            
            
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
