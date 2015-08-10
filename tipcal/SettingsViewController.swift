//
//  SettingsViewController.swift
//  tipcal
//
//  Created by Harley Trung on 8/10/15.
//  Copyright (c) 2015 Harley Trung. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSettingControl: UISegmentedControl!
    
    @IBOutlet weak var poorField: UITextField!
    @IBOutlet weak var okField: UITextField!
    @IBOutlet weak var goodField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println("viewDidLoad: loadSettings")
        loadSettings()
    }

    func saveSettings() {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipSettingControl.selectedSegmentIndex, forKey: "defaultTipControlIndex")
        
        var percentages : [NSObject : AnyObject] = [
            "poorPercentage" : poorField.text,
            "okPercentage": okField.text,
            "goodPercentage": goodField.text
        ]
        defaults.setObject(percentages, forKey: "defaultTipPercentages")
        defaults.synchronize()
    }
    
    func loadSettings() {
        var defaults = NSUserDefaults.standardUserDefaults()
        tipSettingControl.selectedSegmentIndex = defaults.integerForKey("defaultTipControlIndex")
        
        if let percentages = defaults.dictionaryForKey("defaultTipPercentages") {
            poorField.text = String(percentages["poorPercentage"]!.intValue)
            okField.text = String(percentages["okPercentage"]!.intValue)
            goodField.text = String(percentages["goodPercentage"]!.intValue)
            
            updateTipSettingControl(poorField)
            updateTipSettingControl(okField)
            updateTipSettingControl(goodField)
        } else {
            println("default percentages not set")
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateTipSettingControl(sender as! UITextField)
    }
    
    func updateTipSettingControl(field: UITextField) {
        println("tag " + String(field.tag))
        tipSettingControl.setTitle("\(field.text)%", forSegmentAtIndex: field.tag)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        saveSettings()
        println("view will disappear; saving settings()")
    }
}
