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
    
    var logic: MealCalculatorModelLogic? = nil
    var lastMode: Mode = Mode.perPerson
    
    var finalTotal: Double = 00.00
    
    var preTipbillTotal: Double = 0.00
    
    var tipPercentage: Double = 0.125
    
    var amountOfPeople: Double = 1
    
    var controller: MealCalculatorViewController
    
    var selectedField = FieldType()
    
    
    
    
    
    init(controller: MealCalculatorViewController){
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
        
        print(preTipbillTotal)
        
        let returnedTuple = logic!.modification(key, selectedField: selectedField)
        switch(selectedField){
        case .preTipBillTotalField:
            preTipbillTotal = returnedTuple.0
            
                    case .amountOfPeopleField:
            amountOfPeople = returnedTuple.0
            
                    case .tipPercentageField:
            tipPercentage = returnedTuple.0
        default: break
            
            
            
        }
        
        if returnedTuple.0 == 0.00{
            if selectedField == FieldType.tipPercentageField{
                tipPercentage = 12.5
            }else if selectedField == FieldType.amountOfPeopleField{
                amountOfPeople = 1
            }
            updatePrice()

             controller.redraw(nil, field: returnedTuple.1)
            
        }else{
        let formattedValue = formatter(returnedTuple.0, format: returnedTuple.1)
            updatePrice()

        controller.redraw(String?(formattedValue), field: returnedTuple.1)
        }

    }
    
    
    func updatePrice(){
        finalTotal = (preTipbillTotal * (1 + (0.01 * tipPercentage)))
    }
     
    
    
    func formatter(valueToBeFormatted:  Double, format: FieldType)->String{
        print(valueToBeFormatted)
        if format == FieldType.preTipBillTotalField || format == FieldType.finalTotal{
            return "$"+String(NSString(format: "%.2f", valueToBeFormatted) )
        }else if format == FieldType.amountOfPeopleField{
            return String(NSString(format: "%.0f", valueToBeFormatted))
            
        }else if format == FieldType.tipPercentageField{
            return (String(NSString(format: "%.2f", valueToBeFormatted))) + "%"
        }else{
            return ""
        }
        
        
        
    }
    
    
    func changeMode(){
        if(lastMode == .combinedPerPersonTotal){
            lastMode = .perPerson
        }
        else if(lastMode == .perPerson){
            lastMode = .combinedPerPersonTotal
        }
        
        
    
    }
    
    
    
    
}
