//
//  FieldStack.swift
//  Handi
//
//  Created by JohnJoe Stack on 21/08/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import Foundation

class FieldStack: IntStack{
    
    let maxSize: Int
    override func push(item: Int) {
        if items.count < maxSize{
            items.append(item)
        }
        else{
            print("More stuff on stack will cause String for field to be to big")
        }
    }
    
    
    init(maxSize: Int, startDecimalPoint: Double){
        //have max size and decimals or not etc
        self.maxSize = maxSize
        super.init(startDecimalPoint: startDecimalPoint)
    }
    
    override func pop() -> Int {
        if items.count != 0{
            return items.removeLast()
        }else{
            return items.count
        }
        
        
    }
}