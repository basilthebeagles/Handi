//
//  CustomizedUITextFieldController.swift
//  Handi
//
//  Created by JohnJoe Stack on 25/08/2015.
//  Copyright © 2015 FStack. All rights reserved.
//

import Foundation
import UIKit  // don't forget this
//credit: http://stackoverflow.com/questions/29596043/how-to-disable-pasting-in-a-textfield-in-swift


class CustomUITextField: UITextField {
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        if action == "paste:" || action == "cut:" || action == "replace...:" {
            return false
            //ovverides the iOS can peform action function, allowing us to prevent pasting, cutting and replacing being preformed
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
