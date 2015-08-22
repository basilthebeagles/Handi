//
//  IntStack.swift
//  Handi
//
//  Created by JohnJoe Stack on 19/08/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import Foundation


class IntStack {
    var items = [Int]()
    var startDecimalPoint: Double
    
    
    
    init(startDecimalPoint: Double){
        self.startDecimalPoint = startDecimalPoint
        }
    
    
    
     func push(item: Int) {
        items.append(item)
    }
     func pop() -> Int {
        
            return items.removeLast()
        
        
        
    }
    
    func returnDouble()-> Double{
        var foundation = 0.00
        
        
        for i in 0..<items.count{
            
             let temp = Double(Double(items[i]) * startDecimalPoint)
            
                foundation *= 10
                foundation += temp
            
            
            
        }
           
           return foundation
        
    }
    
    
    
     func delete(){
        items.removeAll()
    }
}