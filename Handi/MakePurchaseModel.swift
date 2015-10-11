//
//  MakePurchaseModel.swift
//  Bill Splitter
//
//  Created by JohnJoe Stack on 11/10/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import Foundation



class MakePurchaseModel{
    
    var purchaseHandler: PurchaseHandler?
    
    var viewController: TableViewCellController
    
    var alertController = AlertController()
    var purchase: AvailablePurchases?
    //purchaseHandler.requestProductInfo()
    init(controller: TableViewCellController, purchaseHandlerType: PurchaseHandlerType){
        viewController = controller
        
        
    }
    
    
    func getInAppPurchase(purchase: AvailablePurchases?) -> Bool{
        
    
        
       
        
        if purchase == nil{
            
            purchaseHandler! = PurchaseHandler(creator: self)
        }else{
            self.purchase! = purchase!
            purchaseHandler! = PurchaseHandler(productID: purchase!.rawValue, creator: self)
        }
        
        if purchaseHandler!.transactionInProgress == true{
            errorHandler("A transaction is allready in progress, please try again later")
        }
        
        
        purchaseHandler?.requestProductInfo()
        
            
            
        
        }
        
    
    func transactionSuccess(){
        
    }
        
    func errorHandler(error: String){
        alertController.createAlert("Error", message: error, options: ["Ok"])
    }
    
        
        
            
        
        
    }
    
    
    
    
    
    
    
}