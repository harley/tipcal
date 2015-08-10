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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadSettings()
    }

    func saveSettings() {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipSettingControl.selectedSegmentIndex, forKey: "defaultTipControlIndex")
        defaults.synchronize()
    }
    
    func loadSettings() {
        var defaults = NSUserDefaults.standardUserDefaults()
        tipSettingControl.selectedSegmentIndex = defaults.integerForKey("defaultTipControlIndex")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onChanged(sender: AnyObject) {
        saveSettings()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
