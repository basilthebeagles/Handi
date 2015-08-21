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
    
    
    
    
    init(){
        
        }
     func push(item: Int) {
        items.append(item)
    }
     func pop() -> Int {
        
            return items.removeLast()
        
        
        
    }
    
    func returnDouble()-> Double{
        var foundation = 0.00
        let superScript = -1.00
        
        for i in 0..<items.count{
            
             let temp = Double(Double(items[i]) * pow(100, superScript))
            print("temp: " + String(temp))
                foundation *= 10
                foundation += temp
            
            
            
        }
        //HACK HACK i gotta fix this
        if foundation == 0.0{
            return 0.00
        }
        else{
           return foundation
        }
    }
    
    
    
     func delete(){
        items.removeAll()
    }
}