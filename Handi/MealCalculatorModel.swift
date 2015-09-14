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
        self.controller = controller //sets view conttroller object
        self.logic = MealCalculatorModelLogic(model: self)//sets logic (loads of algorithums) object
        
        
    }
    //var
    
    
    var currentPriceLabelValue: Double{//stored property
        get{
            if(lastMode == .combinedPerPersonTotal){//returns total meal price inc tip
                return finalTotal
            }else if(lastMode == .perPerson){
                
                return finalTotal / Double(amountOfPeople)//returns price per person
            }else{
                return 0.00
            }
        }
    }
    
    
    
    
    func keyPress(key: Key ){//called when a numpad key has been pressed
        
        print(preTipbillTotal)
        var clearAll = false
        
        
        if logic?.currentStackInUse.returnDouble() == 0.0 && key == Key.clear{
            //resets all the values to zero as clear has been double pressed (means clear all)
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
            //asaigns the new value, that has been changed by a keypad press, to the
            //correct var
        case .preTipBillTotalField:
            preTipbillTotal = returnedTuple.0
            
                    case .amountOfPeopleField:
            amountOfPeople = returnedTuple.0
            
                    case .tipPercentageField:
            tipPercentage = returnedTuple.0
        default: break
            
            
            
        }
        
        if returnedTuple.0 == 0 && selectedField == FieldType.amountOfPeopleField{
            //ensures that there is never 0 people, as this is impossible
            //and dividing by 0 is nasty
                amountOfPeople = 1
        }
        
            let formattedValue: String?//this is a optional as passing the text box
        //a nil value resets it and prints the placeholder value
            
            if returnedTuple.0 == 0{//if zero keep as nil and put up placeholder
                formattedValue = nil
            }else{//or format the value to the correct format
                formattedValue = formatter(returnedTuple.0, format: returnedTuple.1)
                

            }
        updatePrice()//updates the stored property of the final price (big green thing)
        
        if clearAll == true{
            //redraws all the values with a placeholder
            controller.redraw(String!(formattedValue), field: FieldType.amountOfPeopleField)
            controller.redraw(String!(formattedValue), field: FieldType.preTipBillTotalField)
            controller.redraw(String!(formattedValue), field: FieldType.tipPercentageField)


            
        }else{
            controller.redraw(String!(formattedValue), field: returnedTuple.1)
        }
        
        
            
        
        

    }
    
    
    func updatePrice(){
        //creates a final total price including tip
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
        //there is a mode where the price per person can be displayed or the total can be displayed, this 
        //handles that
        if(lastMode == .combinedPerPersonTotal){
            lastMode = .perPerson
        }
        else if(lastMode == .perPerson){
            lastMode = .combinedPerPersonTotal
        }
        
        
    
    }
    
    
    
    
}
