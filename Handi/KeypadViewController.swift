//
//  KeypadViewController.swift
//  Handi
//
//  Created by JohnJoe Stack on 19/08/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import UIKit

class KeypadViewController: UIViewController {
    
    
    
    //var parentOfViewController: UIViewController
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //parentOfViewController = self.parentViewController! as UIViewController
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func zeroPressed() {
        print("zero has been pressed")
        keyRouter(Key.zero)
    }
    
    @IBAction func clearPressed() {
        keyRouter(Key.clear)

    }
    @IBAction func backspacePressed() {
        keyRouter(Key.backspace)

    }
    
    
    @IBAction func onePressed() {
        keyRouter(Key.one)

            }
    
    @IBAction func twoPressed() {
        keyRouter(Key.two)

        
    }
    @IBAction func threePressed() {
        keyRouter(Key.three)

    }
    
    @IBAction func fourPressed() {
        keyRouter(Key.four)

    }
    
    @IBAction func fivePressed() {
        keyRouter(Key.five)

    
    }
    
    @IBAction func sixPressed() {
        keyRouter(Key.six)

    }
    
    @IBAction func sevenPressed() {
        keyRouter(Key.seven)

    }
    
    @IBAction func eightPressed() {
        keyRouter(Key.eight)

    }
    
    @IBAction func ninePressed() {
        keyRouter(Key.nine)

        
    }
    
    
    
    
    
    func keyRouter(key: Key){
        //routes the key to the correct parent class.
        //This was somewhat hard.
        
        
        //print("at key router" + String(key.rawValue))
        //print(self.parentViewController)
        if self.parentViewController!.isKindOfClass(MealCalculatorViewController){
           
            let parentView = self.parentViewController as! MealCalculatorViewController
            parentView.keyPress(key)
        }
        
    }
    
    //print(self.parentViewController)
    
    
    
    
    
    
    
    
    
    
    
}







/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/


