//
//  MealCalculatorModelLogic.swift
//  Handi
//
//  Created by JohnJoe Stack on 19/08/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import Foundation


class MealCalculatorModelLogic{
    
    //find out about decimals
    var model: MealCalculatorModel
    
    var preTipTotalStack = FieldStack(maxSize: 8, startDecimalPoint: 0.01)
    var tipPercentageStack = FieldStack(maxSize: 3, startDecimalPoint: 0.1)
    var amountOfPeopleStack = FieldStack(maxSize: 2, startDecimalPoint: 1)
    
    var currentStackInUse = FieldStack(maxSize: 0, startDecimalPoint: 1)
    //bit above is unnecessary, should fix somehow
    
    init(model: MealCalculatorModel){
        self.model = model
    }
    
    func modification(key: Key, selectedField: FieldType)->(Double, FieldType){
        declareCurrentStackInUse(selectedField)
        
        
        switch(key){
        case .clear:
            currentStackInUse.delete()
            
            
            
        case .backspace:
            currentStackInUse.pop()
        default:
            
            currentStackInUse.push(key.rawValue)
            
        }
        
        return (currentStackInUse.returnDouble(), selectedField)

        
    }
    
    
    func returnValues(){
        
    }
    
    func declareCurrentStackInUse(selectedField: FieldType){
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