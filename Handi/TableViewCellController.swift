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
    
    @IBOutlet weak var restorePurchasesSwitch: UISwitch!
    
    var makePurchaseModel: MakePurchaseModel!
    
    
    @IBAction func disableAdvertsSwitchSwitched(sender: AnyObject) {
        
        if makePurchaseModel == nil{
            makePurchaseModel = MakePurchaseModel(purchaseHandlerType: PurchaseHandlerType.purchase, viewController: self)
        }
        
        
        if disableAdvertsSwitch.on == true{
            
            
            makePurchaseModel!.getInAppPurchase(AvailablePurchases.RemoveAds)
            
            
        }
        
        
        
    }
    
    @IBAction func restorePurchasesSwitchSwitched(sender: AnyObject) {
        
        if makePurchaseModel == nil{
            makePurchaseModel! = MakePurchaseModel(purchaseHandlerType: PurchaseHandlerType.restorePurchases, viewController: self)
        }
        
        if restorePurchasesSwitch.on == true{
            
            
            makePurchaseModel!.getInAppPurchase(AvailablePurchases.RemoveAds)
            
            
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
