//
//  MealCalculatorModel.swift
//  Handi
//
//  Created by JohnJoe Stack on 19/08/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import Foundation
import UIKit

class MealCalculatorModel{
    var logic: MealCalculatorModelLogic
    var lastMode: Mode = Mode.combinedPerPersonTotal
    
    var finalTotal: Double = 0.00
    
    var preTipbillTotal: Double = 0.00
    
    var tipPercentage: Double = 0.00
    
    var amountOfPeople: Double = 0.00
    
    var controller: UIViewController
    
    var selectedField = FieldType()
    
    
    
    
    init(controller: UIViewController){
        self.controller = controller
        self.logic = MealCalculatorModelLogic(model: self)
        
    }
    //var
    
    
    var currentPriceLabelValue: Double{
        get{
            if(lastMode == .combinedPerPersonTotal){
                return finalTotal
            }else if(lastMode == .perPerson){
                return finalTotal / Double(amountOfPeople)
            }else{
                return 0.00
            }
        }
    }
    
    
    
    
    func keyPress(key: Key ){
        
        
        
        logic.modification(key, selectedField: selectedField)
        
        
        
        
    }
    
    
    
     
    
    
    func currentPriceLabelFinalString()->String{
        return "$"+String(currentPriceLabelValue)//will make this return currency depending on location
    }
    
    
    func changeMode(){
        if(lastMode == .combinedPerPersonTotal){
            lastMode = .perPerson
        }
        else if(lastMode == .perPerson){
            lastMode = .combinedPerPersonTotal
        }
        
        
    
    }
    //stringValue = "$"+String(value)//will make currency be decided from auto thing
    
    
}
