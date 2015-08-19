//
//  MealCalculatorViewController.swift
//  Handi
//
//  Created by JohnJoe Stack on 18/08/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import UIKit

class MealCalculatorViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var perPersonPriceLabel: UIButton!
    @IBOutlet weak var preTipBillTotalField: UITextField!
    
    @IBOutlet weak var amountOfPeopleField: UITextField!
    
    @IBOutlet weak var tipPercentageField: UITextField!
    
    var perPersonPrice: Double = 0.00
    var finalTotalPrice: Double = 0.00
    var preTipbillTotal: Double = 0.00
    var tipPercentage: Double = 0.00
    var amountOfPeople: Int = 0
    var selectedField: FieldType = FieldType.preTipBillTotalField
    var lastMode: Mode = Mode.combinedPerPersonTotal
    
    
    @IBAction func perPersonPricePressed() {
        //changes mode
        
        if lastMode == .combinedPerPersonTotal{
            redraw(finalTotalPrice)
        }else if lastMode == .perPerson
        
        
    }
    @IBAction func preTipTotalPriceSelected() {
        

    }
    
    
    @IBAction func amountOfPeopleSelected() {
    }
    
    @IBAction func tipPercentageSelected() {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can bae recreated.
        
    }
    
    
    
    func keyPress(pressedKey: Key){
        //called when a key has been pressed
        
       
        
        
        
    }

    func redraw(field: FieldType){
        
        
        
    }
    
    
    func redraw(value: Double){
        
        perPersonPriceLabel.setTitle(String(value), forState: UIControlState.Normal)
        
        
    }
    
    
    
    
}

