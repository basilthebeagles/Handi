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
    var adBannerViewWidth: CGFloat!
    var adBannerViewHeight: CGFloat!
    @IBOutlet weak var priceLabel: UIButton!
    
    
    @IBOutlet weak var preTipBillTotalField: CustomUITextField!
    
    @IBOutlet weak var amountOfPeopleField: CustomUITextField!
    
    @IBOutlet weak var tipPercentageField: CustomUITextField!
    
    
    
    
    
    @IBAction func perPersonPricePressed() {
        //changes mode
        model.changeMode()
        redraw()
        
        
    }
    
    
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
        // Do any additional setup after loading the view, typically from a nib.
        priceLabel.titleLabel!.numberOfLines = 1;
        priceLabel.titleLabel!.adjustsFontSizeToFitWidth = true
        
        let fontSizer = FontSize()
        let correctFontSize = fontSizer.correctFontSizeForScreenSize()
        priceLabel.titleLabel!.font = priceLabel.titleLabel!.font.fontWithSize(correctFontSize.0)
        
        preTipBillTotalField.font = preTipBillTotalField.font?.fontWithSize(correctFontSize.2)
        amountOfPeopleField.font = amountOfPeopleField.font?.fontWithSize(correctFontSize.2)
        tipPercentageField.font = tipPercentageField.font?.fontWithSize(correctFontSize.2)
        
        
        
        
        let dummyView: UIView = UIView(frame: CGRectMake(0, 0, 1, 1))
        
        preTipBillTotalField.inputView = dummyView
        amountOfPeopleField.inputView = dummyView
        tipPercentageField.inputView = dummyView

        
        
        
        
          adBannerViewWidth = CGRectGetWidth(adBannerView.bounds);
          adBannerViewHeight = CGRectGetHeight(adBannerView.bounds);
         firstAdd = true
        
        self.canDisplayBannerAds = true

        self.adBannerView.delegate = self
        self.adBannerView.hidden = true //hide until ad loaded
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
    
    
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        NSLog("bannerViewWillLoadAd")
        print("loading")
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        NSLog("bannerViewDidLoadAd")
        
        if firstAdd! == true{
                self.view.layoutIfNeeded()
                UIView.animateWithDuration(1, animations: {
            print("called")
                //self.keypadBottomConstraint.constant -= self.adBannerViewHeight!
                self.view.layoutIfNeeded()
                self.adBannerView.hidden = false
                    self.firstAdd = false

            })
            
        }
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
        

        NSLog("bannerView")
        print("ERROR iAd")
    }

    
    
    
}

