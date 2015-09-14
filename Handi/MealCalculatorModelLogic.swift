//
//  MealCalculatorModelLogic.swift
//  Handi
//
//  Created by JohnJoe Stack on 19/08/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import Foundation


class MealCalculatorModelLogic{
    
    
    var model: MealCalculatorModel
    //declares stacks with the correct max sizes and max decimal points
    var preTipTotalStack = FieldStack(maxSize: 7, startDecimalPoint: 0.01)
    var tipPercentageStack = FieldStack(maxSize: 3, startDecimalPoint: 0.1)
    var amountOfPeopleStack = FieldStack(maxSize: 2, startDecimalPoint: 1)
    
    var currentStackInUse = FieldStack(maxSize: 0, startDecimalPoint: 1)
    //bit above is unnecessary, should fix somehow
    
    init(model: MealCalculatorModel){
        self.model = model
    }
    
    func modification(key: Key, selectedField: FieldType)->(Double, FieldType){
        //called when a key is pressed, called modification as a modification is being made to the value
        declareCurrentStackInUse(selectedField)//makes sure the modification is being made to the correct value
        
        
        switch(key){
        case .clear:
            currentStackInUse.delete()
            //delets stack if value is clear
            
            
        case .backspace:
            currentStackInUse.pop()//if backspace deletes that last num inputed
        default:
            
            currentStackInUse.push(key.rawValue)//else just assaigns the rawvalue of the key enum to the stack
            
        }
        
        return (currentStackInUse.returnDouble(), selectedField)//returns the new value of the stack, in double form and the changed field

        
    }
    
    
    func returnValues(){
        
    }
    
    func declareCurrentStackInUse(selectedField: FieldType){
        //changes the stack being modified in to the correct one that is assaigned to each text field
        switch(selectedField){
        case .amountOfPeopleField:
            currentStackInUse = amountOfPeopleStack
            
            
        case .preTipBillTotalField:
            print(".preTipBilletc")
            currentStackInUse = preTipTotalStack
            
        case .tipPercentageField:
            currentStackInUse = tipPercentageStack
        default:
            break
        
        }
    }
    
    
    
}