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
    
    var tipPercentage: Double = 0.00
    
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
        var clearAll = false
        
        
        if logic?.currentStackInUse.returnDouble() == 0.0 && key == Key.clear{
            logic?.preTipTotalStack.delete()
            logic?.amountOfPeopleStack.delete()
            logic?.tipPercentageStack.delete()
            
            preTipbillTotal = 0.00
            
            amountOfPeople = 1
            tipPercentage = 0.00
            clearAll = true
        }
        
        let returnedTuple = logic!.modification(key, selectedField: selectedField)
        print(returnedTuple.0)
        
        
        switch(selectedField){
        case .preTipBillTotalField:
            preTipbillTotal = returnedTuple.0
            
                    case .amountOfPeopleField:
            amountOfPeople = returnedTuple.0
            
                    case .tipPercentageField:
            tipPercentage = returnedTuple.0
        default: break
            
            
            
        }
        
        if returnedTuple.0 == 0 && selectedField == FieldType.amountOfPeopleField{
            
                amountOfPeople = 1
        }
        
            let formattedValue: String?
            
            if returnedTuple.0 == 0{
                formattedValue = nil
            }else{
                formattedValue = formatter(returnedTuple.0, format: returnedTuple.1)
                

            }
        updatePrice()
        if clearAll == true{

            controller.redraw(String!(nil), field: FieldType.amountOfPeopleField)
            controller.redraw(String!(nil), field: FieldType.preTipBillTotalField)
            controller.redraw(String!(nil), field: FieldType.tipPercentageField)


            
        }else{
            controller.redraw(String!(formattedValue), field: returnedTuple.1)
        }
        
        
            
        
        

    }
    
    
    func updatePrice(){
        finalTotal = (preTipbillTotal * (1 + (0.01 * tipPercentage)))
        
    }
     
    
    
    func formatter(valueToBeFormatted:  Double, format: FieldType)->String{
        
        
        var numberFormatter: NSNumberFormatter {
            let formatter = NSNumberFormatter()
            formatter.numberStyle = .DecimalStyle
            return formatter
        }
        
        var currencyFormatter: NSNumberFormatter {
            let formatter = NSNumberFormatter()
            formatter.numberStyle = .CurrencyStyle
            return formatter
        }
        
        //source for above: http://rshankar.com/internationalization-and-localization-of-apps-in-xcode-6-and-swift/
        
        
        
        
        
        
        if format == FieldType.preTipBillTotalField || format == FieldType.finalTotal{
            return currencyFormatter.stringFromNumber(valueToBeFormatted)!//"$"+String(NSString(format: "%.2f", valueToBeFormatted) )
        }else if format == FieldType.amountOfPeopleField{
            return numberFormatter.stringFromNumber(valueToBeFormatted)!
            
        }else if format == FieldType.tipPercentageField{
            return numberFormatter.stringFromNumber(valueToBeFormatted)! + "%"
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
