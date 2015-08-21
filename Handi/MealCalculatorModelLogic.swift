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
    
    var preTipTotalStack = FieldStack()
    var tipPercentageStack = FieldStack()
    var amountOfPeopleStack = FieldStack()
    
    var currentStackInUse = FieldStack()
    
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
            print("at function modifications switch statement default case")
            
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
        }
    }
    
    
    
}