//
//  FieldStack.swift
//  Handi
//
//  Created by JohnJoe Stack on 21/08/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import Foundation

class FieldStack: IntStack{
    override func push(item: Int) {
        if items.count < 11{
            items.append(item)
        }
        else{
            print("More stuff on stack will cause String for field to be to big")
        }
    }
    
    
    override func pop() -> Int {
        if items.count != 0{
            return items.removeLast()
        }else{
            return items.count
        }
        
        
    }
}