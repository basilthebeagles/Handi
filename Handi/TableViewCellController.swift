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
    
    
    @IBAction func disableAdvertsSwitchSwitched(sender: AnyObject) {
        
        print("switched")
        
        if disableAdvertsSwitch.on == true{
            
            
            
            
            
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
