//
//  MealCalculatorViewController.swift
//  Handi
//
//  Created by JohnJoe Stack on 18/08/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import UIKit

class MealCalculatorViewController: UIViewController {
    
    
    
    var model: MealCalculatorModel
    
    @IBOutlet weak var priceLabel: UIButton!
    
    
    @IBOutlet weak var preTipBillTotalField: UITextField!
    
    @IBOutlet weak var amountOfPeopleField: UITextField!
    
    @IBOutlet weak var tipPercentageField: UITextField!
    
    
    
    
    
    
    
    convenience init() {
        self.init()
        
        model = MealCalculatorModel(controller: self)
        // ... store or user your objectId
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func perPersonPricePressed() {
        //changes mode
        model.changeMode()
        redraw()
        
        
        
    }
    @IBAction func preTipTotalPriceSelected() {
        model.selectedField = FieldType.preTipBillTotalField

    }
    
    
    @IBAction func amountOfPeopleSelected() {
        model.selectedField = FieldType.amountOfPeopleField
    }
    
    @IBAction func tipPercentageSelected() {
        model.selectedField = FieldType.tipPercentageField
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        priceLabel.titleLabel!.numberOfLines = 1;
        priceLabel.titleLabel!.adjustsFontSizeToFitWidth = true;
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
        
        self.redraw()
        
        switch field{
        case .amountOfPeopleField:
            amountOfPeopleField.text = "placeholder"
        case .preTipBillTotalField:
            preTipBillTotalField.text = "placeholder"
        case .tipPercentageField:
            tipPercentageField.text = "placeholder"
        default:
        print("something went wrong")
        }
    }
    
    
    func redraw(){
        
        priceLabel.setTitle(model.currentPriceLabelFinalString(), forState: UIControlState.Normal)
        
        
    }
    
    
    
    
}

