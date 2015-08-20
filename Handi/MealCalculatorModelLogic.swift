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
    
    var preTipTotalStack = IntStack()
    var tipPercentageStack = IntStack()
    var amountOfPeopleStack = IntStack()
    
    var currentStackInUse = IntStack()
    
    init(model: MealCalculatorModel){
        self.model = model
    }
    
    func modification(key: Key, selectedField: FieldType){
        declareCurrentStackInUse(selectedField)
        
        
        switch(key){
        case .clear:
            currentStackInUse.delete()
        case .backspace:
            currentStackInUse.pop()
        default:
            currentStackInUse.push(key.rawValue)
            
        }
        
        switch(selectedField){
            //i know i should not need to have two identical switch statements but i dont know the
            //right way to combine them.
        case .amountOfPeopleField:
            
            model.amountOfPeople = currentStackInUse.returnDouble()
            
        case .preTipBillTotalField:
            model.preTipbillTotal = currentStackInUse.returnDouble()
            
        case .tipPercentageField:
            model.tipPercentage = currentStackInUse.returnDouble()
        }

        
    }
    
    
    func returnValues(){
        
    }
    
    func declareCurrentStackInUse(selectedField: FieldType){
        switch(selectedField){
        case .amountOfPeopleField:
            currentStackInUse = amountOfPeopleStack
            
            
        case .preTipBillTotalField:
            currentStackInUse = preTipTotalStack
            
        case .tipPercentageField:
            currentStackInUse = tipPercentageStack
        }
    }
    
    
    
}