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
    
    var makePurchaseModel: MakePurchaseModel?
    var restorePurchaseModel: RestorePurchasesModel?
    
    @IBAction func disableAdvertsSwitchSwitched(sender: AnyObject) {
        
        if makePurchaseModel == nil{
            makePurchaseModel! = MakePurchaseModel(controller: self, purchase: AvailablePurchases.RemoveAds)
        }
        
        
        if disableAdvertsSwitch.on == true{
            
            
            
            
            
        }
        
        
        
    }
    
    @IBAction func restorePurchasesSwitchSwitched(sender: AnyObject) {
        if restorePurchaseModel == nil{
            restorePurchaseModel! = RestorePurchasesModel(controller: self)
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
