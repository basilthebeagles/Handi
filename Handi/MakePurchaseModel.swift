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
    
    var purchaseHandler: PurchaseHandler?
    
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
            
            purchaseHandler = PurchaseHandler(creator: self)
        }else{
            self.purchase = purchase!
            purchaseHandler = PurchaseHandler(productID: purchase!.rawValue, creator: self)
        }
        
        if purchaseHandler!.transactionInProgress == true{
            errorHandler("A transaction is allready in progress, please try again later")
            encounteredError = true
        }
        
        
        purchaseHandler!.requestProductInfo()
        
        
        
        
    }
    
    
    func transactionSuccess(){
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: purchase!.rawValue)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.mealCalculatorViewController!.canDisplayBannerAds = false
        appDelegate.optionsTableViewController.removeAdsPurchased()

        
    }
    
    
    
    
    
    
    
    func errorHandler(error: String){
        
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



