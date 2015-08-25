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
    
    @IBOutlet weak var zero: UIButton!//is actually clear
    
    @IBOutlet weak var clear: UIButton! // is actually 0
    
    @IBOutlet weak var backspace: UIButton!
    
    @IBOutlet weak var one: UIButton!
    
    @IBOutlet weak var two: UIButton!
    
    @IBOutlet weak var three: UIButton!
    
    @IBOutlet weak var four: UIButton!
    
    @IBOutlet weak var five: UIButton!
    
    @IBOutlet weak var six: UIButton!
    
    @IBOutlet weak var seven: UIButton!
    
    @IBOutlet weak var eight: UIButton!
    
    @IBOutlet weak var nine: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fontSizer = FontSize()
        
        let correctFontSize = fontSizer.correctFontSizeForScreenSize()
        
        
        
        zero.titleLabel!.font = zero.titleLabel!.font.fontWithSize(correctFontSize.1)
        
        clear.titleLabel!.font = clear.titleLabel!.font.fontWithSize(correctFontSize.1)
        
        backspace.titleLabel!.font = backspace.titleLabel!.font.fontWithSize(correctFontSize.1)
        
        one.titleLabel!.font = one.titleLabel!.font.fontWithSize(correctFontSize.1)
        
        two.titleLabel!.font = two.titleLabel!.font.fontWithSize(correctFontSize.1)
        
        three.titleLabel!.font = three.titleLabel!.font.fontWithSize(correctFontSize.1)
        
        four.titleLabel!.font = four.titleLabel!.font.fontWithSize(correctFontSize.1)
        
        five.titleLabel!.font = five.titleLabel!.font.fontWithSize(correctFontSize.1)
        
        six.titleLabel!.font = six.titleLabel!.font.fontWithSize(correctFontSize.1)
        
        seven.titleLabel!.font = seven.titleLabel!.font.fontWithSize(correctFontSize.1)
        
        eight.titleLabel!.font = eight.titleLabel!.font.fontWithSize(correctFontSize.1)
        
        nine.titleLabel!.font = nine.titleLabel!.font.fontWithSize(correctFontSize.1)
        
        

        //add all of them
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func zeroPressed() {//is actually c
        print("zero has been pressed")
        keyRouter(Key.clear)
    }
    
    @IBAction func clearPressed() {//is actually zero
        keyRouter(Key.zero)

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


