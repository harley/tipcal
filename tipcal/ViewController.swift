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
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipField.text = "$0.00"
        totalField.text = "$100.00"
     
        loadSettings()
    }
    
    
    @IBAction func onEditingChanged(snder: AnyObject) {
        var billingAmount = (billField.text as NSString).doubleValue
        var tipPercentages = [0.18, 0.20, 0.22]
        var tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
        var tipAmount = billingAmount * tipPercent
        var totalAmount = billingAmount + tipAmount
        
        tipField.text = String(format: "$%.2f", tipAmount)
        totalField.text = String(format: "$%.2f", totalAmount)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func loadSettings() {
        println("load settings")
        var defaults = NSUserDefaults.standardUserDefaults()
        var tipControlIndex = defaults.integerForKey("defaultTipControlIndex")
        tipControl.selectedSegmentIndex = tipControlIndex
    }
    
    override func viewWillAppear(animated: Bool) {
        var defaults = NSUserDefaults.standardUserDefaults()
        loadSettings()
        
        super.viewWillAppear(animated)
        println("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }


}