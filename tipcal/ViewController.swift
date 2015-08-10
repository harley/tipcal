//
//  ViewController.swift
//  tipcal
//
//  Created by Harley Trung on 8/9/15.
//  Copyright (c) 2015 Harley Trung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipField: UILabel!
    @IBOutlet weak var totalField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipField.text = "$0.00"
        totalField.text = "$100.00"
        
    }
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var billingAmount = (billField.text as NSString).doubleValue
        var tipPercent = 0.20
        var tipAmount = billingAmount * tipPercent
        var totalAmount = billingAmount + tipAmount
        
        tipField.text = String(format: "$%.2f", tipAmount)
        totalField.text = String(format: "$%.2f", totalAmount)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

