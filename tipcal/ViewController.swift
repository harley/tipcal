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
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipField: UILabel!
    @IBOutlet weak var totalField: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var dividerView: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    var tipPercentages:[Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hideFields()
        
        tipField.text = "$0.00"
        totalField.text = "$0.00"
     
        loadSettings()
        
    }
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var billingAmount = (billField.text as NSString).doubleValue
        var tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
        var tipAmount = billingAmount * tipPercent
        var totalAmount = billingAmount + tipAmount
        
        tipField.text = String(format: "$%.2f", tipAmount)
        totalField.text = String(format: "$%.2f", totalAmount)
        
        if billField.text.isEmpty {
            UIView.animateWithDuration(0.5, animations: { self.hideFields() })
        }
        else {
            UIView.animateWithDuration(1.5, animations: { self.showFields() })
        }
    }
    
    func hideFields() {
        self.tipControl.alpha = 0
        self.tipField.alpha = 0
        self.tipLabel.alpha = 0
        self.dividerView.alpha = 0
        self.totalLabel.alpha = 0
    }
    
    func showFields() {
        self.tipControl.alpha = 1
        self.tipField.alpha = 1
        self.tipLabel.alpha = 1
        self.dividerView.alpha = 1
        self.totalLabel.alpha = 1
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
        if let percentages = defaults.dictionaryForKey("defaultTipPercentages") {
            let val0 = percentages["poorPercentage"] as! NSString
            let segment0 = "\(val0)%"
        
            let val1 =  percentages["okPercentage"] as! NSString
            let segment1 = "\(val1)%"
            
            let val2 =  percentages["goodPercentage"] as! NSString
            let segment2 = "\(val2)%"
            
            tipPercentages = [val0.doubleValue * 0.01, val1.doubleValue * 0.01, val2.doubleValue * 0.01]
            tipControl.setTitle(segment0, forSegmentAtIndex: 0)
            tipControl.setTitle(segment1, forSegmentAtIndex: 1)
            tipControl.setTitle(segment2, forSegmentAtIndex: 2)
            
            onEditingChanged(tipControl)
        }
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