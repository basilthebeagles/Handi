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
    /*
    func correctFontSizeForDevice()-> (Int, Int){
        //terrible function view below function
        
        var screen: CGRect = UIScreen.mainScreen().bounds
        var screenWidth = screen.width
        
        if screenWidth == 375{
            return (90, 71)
        }else if screenWidth == 320{
            return (90, 71)
        }
        
       return (0, 0)
    }
    
    */
    
    func correctFontSizeForScreenSize()->(CGFloat, CGFloat){
    //going to change this so it returns set values for knowns, like 71 for iphone 6 size
    
    
    var screen: CGRect = UIScreen.mainScreen().bounds
        if screen.width == 375{
            return (CGFloat(90), CGFloat(71))
        }
        
        
        else{
            //this is just here for when a new device is made or something
            // and i dont update it in time 
            // you would think to use ratios like this for all devices, but the results of the ratio
            //dont allways look so nice
    var totalScreenSize = screen.height + screen.width
        
    var temp = totalScreenSize / 14.6760563380282
    //make sure you work out a ratio for finalValueLabel
            
            print(temp)
    return (CGFloat(temp), CGFloat(temp))
        }
    
    
    }
    
    
}