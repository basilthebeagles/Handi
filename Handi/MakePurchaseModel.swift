//
//  MakePurchaseModel.swift
//  Bill Splitter
//
//  Created by JohnJoe Stack on 11/10/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import Foundation
import UIKit


class MakePurchaseModel{
    
    var purchaseHandler: PurchaseHandler?//
    
    var encounteredError = false
    
    var alertController = AlertController()
    var purchase: AvailablePurchases!
    var viewController: TableViewCellController!
    
    var purchaseHandlerType: PurchaseHandlerType!
    
    
    init(purchaseHandlerType: PurchaseHandlerType, viewController : TableViewCellController){
        
        self.purchaseHandlerType = purchaseHandlerType
        self.viewController = viewController
        
    }
    
    
   
    
    
    
    
        

        
        
    func getInAppPurchase(purchase: AvailablePurchases?){
        
        
        
        
        
        if purchase == nil{
            //this happens when the function is called, but has not specified a purchase
            //this implies for purchases to be restored
            purchaseHandler = PurchaseHandler(creator: self)
        }else{
            
            self.purchase = purchase!
            print(self.purchase!.rawValue)
            purchaseHandler = PurchaseHandler(productID: purchase!.rawValue, creator: self)
        }
        
        if purchaseHandler!.transactionInProgress == true{
            errorHandler("A transaction is allready in progress, please try again later")
            encounteredError = true
            
        }
        
        
        purchaseHandler!.requestProductInfo()
        
        
        
        
    }
    
    
    func transactionSuccess(){
        //called by PurchaseHandler when the transaction has gone through successfully
        //called weather purchases have been restored or purchased
        print("here")
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "com.f_stack.billsplitter.remove_ads")
        //this is incomplete though and allways assumes that a specific purchase has been made. 
        //If i do more in app purchases I will need to change this
        
        print("woohoo success")
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.updateInAppPurchases()
        appDelegate.mealCalculatorViewController!.canDisplayBannerAds = false
        appDelegate.optionsTableViewController.removeAdsPurchased(true)

        alertController.createAlert("Thank You!", message: "Ads have now been removed.", options: ["OK"])
    }
    
    
    
    
    
    
    
    func errorHandler(error: String){
        //if an error is encountered by this class or purchase handler it is called
        //this resets the switches to their off states and creates an alers
        if encounteredError == false{
            if purchaseHandlerType! == .restorePurchases{
                
                viewController!.restorePurchasesSwitch.on = false
                
                
            }else if purchaseHandlerType! == .purchase{
                viewController!.disableAdvertsSwitch.on = false
            }
            
            encounteredError = true
        }else{
            
        }
        
        alertController.createAlert("Error", message: error, options: ["Ok"])
        
    }
    
    
    
    
    
    
}



