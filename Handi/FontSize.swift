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
   //this function creates a nice sized font, depending on the screen size of a device
    
    func correctFontSizeForScreenSize()->(CGFloat, CGFloat, CGFloat){
        //returns correct font size for different fields, depending on screen size.
        //the values i have choosen are ones that i think look best.
    
    var screen: CGRect = UIScreen.mainScreen().bounds
       
            
    let totalScreenSize = screen.height + screen.width
        
    let buttonLabelFontSize = totalScreenSize / 18
    
    let finalLabelFontSize = totalScreenSize / 10
    let textFieldFontSize = totalScreenSize / 41.68
        print(textFieldFontSize)
    print(finalLabelFontSize)
    print(buttonLabelFontSize)
    return (CGFloat(finalLabelFontSize), CGFloat(buttonLabelFontSize), CGFloat(textFieldFontSize))
        
    
    
    }
    
    
}