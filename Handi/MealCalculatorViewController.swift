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
            redraw(perPersonPrice)
            lastMode = .perPerson
            
            
        }else if lastMode == .perPerson{
            redraw(finalTotalPrice)
            lastMode = .combinedPerPersonTotal
            
        }
        
        
    }
    @IBAction func preTipTotalPriceSelected() {
        selectedField = FieldType.preTipBillTotalField

    }
    
    
    @IBAction func amountOfPeopleSelected() {
        selectedField = FieldType.amountOfPeopleField
    }
    
    @IBAction func tipPercentageSelected() {
        selectedField = FieldType.tipPercentageField
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        perPersonPriceLabel.titleLabel!.numberOfLines = 1;
        perPersonPriceLabel.titleLabel!.adjustsFontSizeToFitWidth = true;
        //perPersonPriceLabel.titleLabel!.lineBreakMode = NSLineBreakByClipping
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
        let stringValue = "$"+String(value)//will make currency be decided from auto thing 
        perPersonPriceLabel.setTitle(stringValue, forState: UIControlState.Normal)
        
        
    }
    
    
    
    
}

