//
//  InAppPurchaseErrorStrings.swift
//  Bill Splitter
//
//  Created by JohnJoe Stack on 11/10/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import Foundation

enum InAppPurchaseErrorStrings: String{
    
    
    case userCanNotMakePayments = "This user can not make payments. This may be due to parental controls"
    case genericError = "Error, please try again later."
    case genericTransactionFailed = "Transaction failed, please try again later."
    case noInAppPurchasesAvailable = "Transaction failed, please try again later. (Invalid Product Id). Contact the developer about this using the support option."
    case noPurchasesFound = "No purchases found, if you believe you have recieved this message in error, please contact support." 
    
}