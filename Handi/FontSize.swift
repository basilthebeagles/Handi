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
   
    
    func correctFontSizeForScreenSize()->(CGFloat, CGFloat, CGFloat){
        
    
    var screen: CGRect = UIScreen.mainScreen().bounds
       
            
    let totalScreenSize = screen.height + screen.width
        
    let buttonLabelFontSize = totalScreenSize / 14.6760563380282
    
    let finalLabelFontSize = totalScreenSize / 10
    let textFieldFontSize = totalScreenSize / 41.68
        print(textFieldFontSize)
    print(finalLabelFontSize)
    print(buttonLabelFontSize)
    return (CGFloat(finalLabelFontSize), CGFloat(buttonLabelFontSize), CGFloat(textFieldFontSize))
        
    
    
    }
    
    
}