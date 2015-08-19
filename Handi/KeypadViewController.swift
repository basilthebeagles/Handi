//
//  KeypadViewController.swift
//  Handi
//
//  Created by JohnJoe Stack on 19/08/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import UIKit

class KeypadViewController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var zero: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func zeroPressed(sender: AnyObject) {
        
        print(self.parentViewController)
        
        
        
        
        
    }
    
    
    
    //func controllerRouter()
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
