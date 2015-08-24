//
//  MealCalculatorViewController.swift
//  Handi
//
//  Created by JohnJoe Stack on 18/08/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import UIKit

class MealCalculatorViewController: UIViewController, UITextFieldDelegate {
    
    //seperate this stuff out to presentation and controller
    //also seperate out total and tip
    var model: MealCalculatorModel!
    
    
    @IBOutlet weak var priceLabel: UIButton!
    
    
    @IBOutlet weak var preTipBillTotalField: UITextField!
    
    @IBOutlet weak var amountOfPeopleField: UITextField!
    
    @IBOutlet weak var tipPercentageField: UITextField!
    
    
    
    
    
    
    @IBAction func perPersonPricePressed() {
        //changes mode
        model.changeMode()
        redraw()
        
        
    }
    
    
    @IBAction func preTipTotalSelected() {
        print("pretip field selected")
        preTipBillTotalField.resignFirstResponder()
        model.selectedField = FieldType.preTipBillTotalField
        //preTipBillTotalField.beginFloatingCursorAtPoint(<#T##point: CGPoint##CGPoint#>)
    }
    
    
    @IBAction func amountOfPeopleSelected() {
        print("amount of people selected")
        model.selectedField = FieldType.amountOfPeopleField
        amountOfPeopleField.resignFirstResponder()
        //amountOfPeopleField.endFloatingCursor()
        
   }
    
    
        

    @IBAction func tipPercentageSelected() {
        print("tip percentage selected")
        tipPercentageField.resignFirstResponder()
        //tipPercentageField.set(CGPoint(x: 8, y: 10))//NSMakeRange(5, 10))
        model.selectedField = FieldType.tipPercentageField
        
        //tipPercentageField.endFloatingCursor()
    }
    
   
    
  /*  func textFieldDidBeginEditing(textField: UITextField) {
        self.view.endEditing(true)
    }
    
   
    */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.model = MealCalculatorModel(controller: self)
        // Do any additional setup after loading the view, typically from a nib.
        priceLabel.titleLabel!.numberOfLines = 1;
        priceLabel.titleLabel!.adjustsFontSizeToFitWidth = true
        
        var fontSizer = FontSize()
        var correctFontSize = fontSizer.correctFontSizeForScreenSize()
        priceLabel.titleLabel!.font = priceLabel.titleLabel!.font.fontWithSize(correctFontSize.0)
        preTipBillTotalField.delegate = self
        amountOfPeopleField.delegate = self
        tipPercentageField.delegate = self
        
        redraw()
        
        //perPersonPriceLabel.titleLabel!.lineBreakMode = NSLineBreakByClipping
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can bae recreated.
        
    }
    
    
    
    //put this in to something else
    
    func keyPress(pressedKey: Key){
        //called when a key has been pressed
        
       model.keyPress(pressedKey)
        
        
        
    }

    func redraw(newValue: String?, field: FieldType){
        
        self.redraw()
        
        
        
        
        switch field{
        case .amountOfPeopleField:
            amountOfPeopleField.text = newValue
        case .preTipBillTotalField:
            preTipBillTotalField.text = newValue
        case .tipPercentageField:
            tipPercentageField.text = newValue
        default:
            break
        }
    }
    
    
    func redraw(){
        
        priceLabel.setTitle(model.formatter(model.currentPriceLabelValue, format: FieldType.finalTotal
            ), forState: UIControlState.Normal)
        
        
    }
    
    
    
    
}

