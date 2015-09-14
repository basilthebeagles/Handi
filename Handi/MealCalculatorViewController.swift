//
//  MealCalculatorViewController.swift
//  Handi
//
//  Created by JohnJoe Stack on 18/08/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import UIKit
import iAd

class MealCalculatorViewController: UIViewController, ADBannerViewDelegate {
    @IBOutlet weak var keypadBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var keyPadView: UIView!
    
    @IBOutlet weak var adBannerView: ADBannerView!
    
    //seperate this stuff out to presentation and controller
    //also seperate out total and tip
    
    var model: MealCalculatorModel!
    
    var firstAdd: Bool!
    
    @IBOutlet weak var priceLabel: UIButton!
    
    
    @IBOutlet weak var preTipBillTotalField: CustomUITextField!
    
    @IBOutlet weak var amountOfPeopleField: CustomUITextField!
    
    @IBOutlet weak var tipPercentageField: CustomUITextField!
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
            let newViewController = segue.destinationViewController
        if newViewController.isKindOfClass(SettingsViewController){
             self.canDisplayBannerAds = false
            let temp = newViewController as! SettingsViewController
                temp.previousViewController = self
            
        }
       
        
        
    }
    
    
    @IBAction func perPersonPricePressed() {
        //called when total text is touched
        //which means the user wants the mode changed
        
        model.changeMode()
        redraw()//redraws the total text
        
        
    }
    
    //following functions are called when their text fields are selected
    //they will change the selected field to themselves
    @IBAction func preTipTotalSelected() {
        print("pretip field selected")
        
        model.selectedField = FieldType.preTipBillTotalField
           }
    
    
    @IBAction func amountOfPeopleSelected() {
        print("amount of people selected")
                model.selectedField = FieldType.amountOfPeopleField
        
        
   }
    
    
        

    @IBAction func tipPercentageSelected() {
        print("tip percentage selected")
        
        model.selectedField = FieldType.tipPercentageField
        
            }
    
   
    
  /*  func textFieldDidBeginEditing(textField: UITextField) {
        self.view.endEditing(true)
    }
    
   
    */
    
    override func viewDidAppear(animated: Bool) {
        

    }
    
    
    override func viewDidLoad() {

        super.viewDidLoad()

        self.model = MealCalculatorModel(controller: self)
        self.navigationController?.navigationBarHidden = true
         
        priceLabel.titleLabel!.numberOfLines = 1;
        priceLabel.titleLabel!.adjustsFontSizeToFitWidth = true
        
        let fontSizer = FontSize()
        let correctFontSize = fontSizer.correctFontSizeForScreenSize()
        
        priceLabel.titleLabel!.font = priceLabel.titleLabel!.font.fontWithSize(correctFontSize.0)
        
        preTipBillTotalField.font = preTipBillTotalField.font?.fontWithSize(correctFontSize.2)
        amountOfPeopleField.font = amountOfPeopleField.font?.fontWithSize(correctFontSize.2)
        tipPercentageField.font = tipPercentageField.font?.fontWithSize(correctFontSize.2)
        
        
        //these lines here allow me to assaign a dummy view to the text fields
        //which then allows me to prevent pasting in to them
        
        let dummyView: UIView = UIView(frame: CGRectMake(0, 0, 1, 1))
        
        preTipBillTotalField.inputView = dummyView
        amountOfPeopleField.inputView = dummyView
        tipPercentageField.inputView = dummyView

        
        
        
        
        
        firstAdd = true
        self.adBannerView.delegate = self
        self.canDisplayBannerAds = true

        self.adBannerView.hidden = true //hide until ad loaded
        self.keypadBottomConstraint.constant -= self.adBannerView.frame.height

        redraw()
        
       
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
        
        self.redraw()//redraws the total field
        
        
        
        //changes the correct textfield to its new values
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
        //changes the total field to the correct new value and format
        priceLabel.setTitle(model.formatter(model.currentPriceLabelValue, format: FieldType.finalTotal
            ), forState: UIControlState.Normal)
        
        
    }
    
    
   
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        NSLog("bannerViewWillLoadAd")
        print("loading")
    }

    func bannerViewDidLoadAd(banner: ADBannerView!) {
        NSLog("bannerViewDidLoadAd")
        
        if firstAdd! == true{
            firstAdd! = false
            //if this is a new valid add then make space on screen
            self.keypadBottomConstraint.constant += (self.adBannerView.frame.height) 

        }
        print(adBannerView.frame.size
        )
                self.adBannerView.hidden = false
        
         //now show banner as ad is loaded
        
        print("banner getting shown")
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        NSLog("bannerViewDidLoadAd")
        
        //optional resume paused game code
        
    }

    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        NSLog("bannerViewActionShouldBegin")
        
        //optional pause game code
        
        return true
    }

    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        //if there has been an add error and adds have been displayed hide the adbar
        if firstAdd! == false{//TODO do fancy optional thing here
            //self.keypadBottomConstraint.constant -= self.adBannerView.frame.height
            firstAdd! == true
        
        }
       
        self.adBannerView.hidden = true
        
        
        print("ERROR iAd")
    }

    
    
    
}

