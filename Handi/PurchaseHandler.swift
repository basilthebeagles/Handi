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
    
    let type: PurchaseHandlerType
    
    var selectedProductIndex: Int!
    var creator: MakePurchaseModel!
    var transactionInProgress = false
    
    init(productID: String, creator: MakePurchaseModel){
        self.creator = creator
        type = PurchaseHandlerType.purchase
        super.init()
        self.productIDs.append(productID)        //"com.f_stack.billsplitter.remove_ads"
        
        SKPaymentQueue.defaultQueue().addTransactionObserver(self)
        
    }
    
    init(creator: MakePurchaseModel){
        self.creator = creator
        type = PurchaseHandlerType.restorePurchases
        super.init()
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
            creator.errorHandler(InAppPurchaseErrorStrings.userCanNotMakePayments.rawValue)
        }
    }
    
       @objc func productsRequest(request: SKProductsRequest, didReceiveResponse response: SKProductsResponse)  {
        if response.products.count != 0 {
            for product in response.products {
                print("adding to product array")
                productsArray.append(product)
            }
            print("doing self.buyProduct")
            //return true
            //self.showActions()
             if type == .purchase{
                self.buyProduct()
            }
        }
        else {
            //todo handle more stuff here
            if type == .restorePurchases{
                self.restorePurchases()
            }
            print("There are no available in app purchases.")
        }
    
        if response.invalidProductIdentifiers.count != 0 {
            //handle this
            //the provided product identifiers are not correct/do not exist
            print(response.invalidProductIdentifiers.description)
            print("invalid product id")
            creator.errorHandler(InAppPurchaseErrorStrings.noInAppPurchasesAvailable.rawValue)
        }
        //return false
    }
    
    
    
    
    
    
    
    func buyProduct(){
        self.transactionInProgress = true
        let payment = SKPayment(product: self.productsArray[0] as SKProduct)
        SKPaymentQueue.defaultQueue().addPayment(payment)
        self.transactionInProgress = true
    }
    
    
    func restorePurchases(){
        print("restoring")
        self.transactionInProgress = true
        SKPaymentQueue.defaultQueue().restoreCompletedTransactions()
    }
    
       @objc func paymentQueue(queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            print(transaction.error)
            switch transaction.transactionState {
                
            case SKPaymentTransactionState.Purchased:
                print("Transaction completed successfully.")
                SKPaymentQueue.defaultQueue().finishTransaction(transaction)
                transactionInProgress = false
                creator.transactionSuccess()
            case SKPaymentTransactionState.Restored:
                SKPaymentQueue.defaultQueue().finishTransaction(transaction)
                print("purchases restored")
                print(transaction.payment.productIdentifier)
                
                creator.purchase = AvailablePurchases(rawValue: transaction.payment.productIdentifier)
                
                
                
                transactionInProgress = false
                creator.transactionSuccess()
                
                
            case SKPaymentTransactionState.Failed:
                print("Transaction Failed");
                SKPaymentQueue.defaultQueue().finishTransaction(transaction)
                transactionInProgress = false
                creator.errorHandler(InAppPurchaseErrorStrings.genericTransactionFailed.rawValue)
                
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