//
//  IntStack.swift
//  Handi
//
//  Created by JohnJoe Stack on 19/08/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import Foundation


struct IntStack {
    var items = [Int]()
    mutating func push(item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    func returnDouble()-> Double{
        var foundation = 0.00
        var superScript = 1.00
        for i in items{
            foundation += Double(items[i]) * pow(100, superScript)
            superScript -= 0.5
        }
        return foundation
    }
}