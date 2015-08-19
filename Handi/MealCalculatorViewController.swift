//
//  MealCalculatorViewController.swift
//  Handi
//
//  Created by JohnJoe Stack on 18/08/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import UIKit

class MealCalculatorViewController: UIViewController {
    
    @IBOutlet weak var perPersonPriceLabel: UILabel!
    
    @IBOutlet weak var preTipBillTotalField: UITextField!
    
    @IBOutlet weak var amountOfPeopleField: UITextField!
    
    @IBOutlet weak var tipPercentageField: UITextField!
    
    var perPersonPrice: Double = 0.00
    var preTipPillTotal: Double = 0.00
    var tipPercentage: Double = 0.00
    var amountOfPeople: Int = 0
    
    
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

    func redraw(){
        
        
        
    }
    
    
    
    
}

