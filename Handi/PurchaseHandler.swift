//
//  PurchaseHandler.swift
//  Bill Splitter
//
//  Created by JohnJoe Stack on 01/10/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import Foundation
import StoreKit
//source: http://www.appcoda.com/in-app-purchase-tutorial/

class PurchaseHandler: NSObject, SKPaymentTransactionObserver, SKProductsRequestDelegate{
    
    var selectedProductIndex: Int!
    
    var transactionInProgress = false
    
    init(productID: String){
        
        super.init()
    self.productIDs.append(productID)        //"com.f_stack.billsplitter.remove_ads"
        
        SKPaymentQueue.defaultQueue().addTransactionObserver(self)
        
    }
    
    
    
    
    
    func requestProductInfo() {
        if SKPaymentQueue.canMakePayments() {
            let productIdentifiers = NSSet(array: productIDs)
            let productRequest = SKProductsRequest(productIdentifiers: productIdentifiers as! Set<String>)
            
            productRequest.delegate = self
            productRequest.start()
            print("requesting")
        }
        else {
            //todo: handle some stuff here
            print("Cannot perform In App Purchases.")
        }
    }
    
       @objc func productsRequest(request: SKProductsRequest, didReceiveResponse response: SKProductsResponse) {
        if response.products.count != 0 {
            for product in response.products {
                print("adding to product array")
                productsArray.append(product)
            }
            print("doing self.buyProduct")
            self.buyProduct()
            //self.showActions()
        }
        else {
            //todo handle more stuff here
            print("There are no available in app purchases.")
        }
    
        if response.invalidProductIdentifiers.count != 0 {
            //handle this
            //the provided product identifiers are not correct/do not exist
            print(response.invalidProductIdentifiers.description)
            print("invalid product id")
        }
    }
    
    
    
    /*func showActions() {
        if transactionInProgress {
            
            //handle this, probably make an UIAlertAction to tell user something allready in progress
            return
        }
        
        let actionSheetController = UIAlertController(title: "IAPDemo", message: "What do you want to do?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let buyAction = UIAlertAction(title: "Buy", style: UIAlertActionStyle.Default) { (action) -> Void in
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) -> Void in
            
        }
        
        actionSheetController.addAction(buyAction)
        actionSheetController.addAction(cancelAction)
        
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    */
    
    
    
    func buyProduct(){
        self.transactionInProgress = true
        let payment = SKPayment(product: self.productsArray[0] as SKProduct)
        SKPaymentQueue.defaultQueue().addPayment(payment)
        self.transactionInProgress = true
    }
    
       @objc func paymentQueue(queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            print(transaction.error)
            switch transaction.transactionState {
            case SKPaymentTransactionState.Purchased:
                print("Transaction completed successfully.")
                SKPaymentQueue.defaultQueue().finishTransaction(transaction)
                transactionInProgress = false
                
            case SKPaymentTransactionState.Restored:
                SKPaymentQueue.defaultQueue().finishTransaction(transaction)
                transactionInProgress = false
                
                print("?????")
                
            case SKPaymentTransactionState.Failed:
                print("Transaction Failed");
                SKPaymentQueue.defaultQueue().finishTransaction(transaction)
                transactionInProgress = false

                
            default:
                print("printing default")
                print(transaction.transactionState.rawValue)
            }
        }
    }
    
    var productIDs: [String] = []
    
    var productsArray: Array<SKProduct!> = []
    //"com.f_stack.billsplitter.remove_ads"
        
    
    
    
    
    
}