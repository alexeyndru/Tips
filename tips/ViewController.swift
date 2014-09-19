//
//  ViewController.swift
//  tips
//
//  Created by Alex Tau on 17/09/14.
//  Copyright (c) 2014 King Ginger Studio All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tipLabel:UILabel!
    @IBOutlet weak var totalLabel:UILabel!
    @IBOutlet weak var tipTextField:UITextField!
    @IBOutlet weak var tipControl:UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tipLabel.text = "$0.00"
        self.totalLabel.text = "$0.00"
    }
    
    @IBAction func backgroundTap(sender:AnyObject) {
        self.tipTextField?.resignFirstResponder()
    }

    
    @IBAction func onEditingChanged(sender:AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (tipTextField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
       func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

