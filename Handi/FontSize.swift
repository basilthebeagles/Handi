//
//  FontSize.swift
//  Handi
//
//  Created by JohnJoe Stack on 23/08/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import Foundation

import UIKit


struct FontSize{
    
    func correctFontSizeForDevice(originalFontSize: Int)-> (Int, Int){
        //terrible function view below function
        
        var screen: CGRect = UIScreen.mainScreen().bounds
        var screenWidth = screen.width
        
        if screenWidth == 375{
            return (90, 71)
        }else if screenWidth == 320{
            return (90, 71)
        }
        
        
    }
    
    
    /*
    func getCorrectFontSizeForScreenSize(font: Int)->Int{
    //for some reason the value returned from this, when used as an
    //argument for .fontwithSize gives an error of cant accept (Int)
    
    
    var screen: CGRect = UIScreen.mainScreen().bounds
    
    var totalScreenSize = Int(screen.height) + Int(screen.width)
    var temp = totalScreenSize / Int(13)
    print(temp)
    return temp
    
    
    }
    
    */
}