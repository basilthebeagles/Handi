//
//  PlistHandler.swift
//  Bill Splitter
//
//  Created by JohnJoe Stack on 01/10/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import Foundation
//WORK IN PROGRESS

class PlistHandler{
    
    
    init(){
        
    }
    
    func getPlistContents(fileName: String) -> [String: String]?{
        var myDict: NSDictionary?
        
        if let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "plist", inDirectory: "Handi/Lib") {
            myDict = NSDictionary(contentsOfFile: path)
        }else{
            NSLog("Could not open file")
            return nil
        }
        
        
        if let dict = myDict {
            return dict as! [String : String]
        }else{
            return nil
        }
    }
    
    
    
    func getDictionary(fileName: String) -> [String: String]?{
        return getPlistContents(fileName)
    }
    
    
    func getArray(fileName: String) -> [String]?{
        
        

        if let dict = getPlistContents(fileName){
            var arr = Array(dict.keys)
            
            return arr
        }else{
            return nil
        }
        
        
        
        
        
    }
    
    
}