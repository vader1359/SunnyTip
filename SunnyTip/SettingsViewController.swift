//
//  SettingsViewController.swift
//  SunnyTip//
//  Created by Vader1359 on 5/1/17.
//  Copyright © 2017 vader1359. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    
    @IBOutlet weak var CurrencyLabel: UILabel!
    @IBOutlet weak var CurrencyPicker: UISegmentedControl!
    
     let defaults = UserDefaults.standard
    
    
//      
    
    
    @IBAction func pickCurrency(_ sender: Any) {
        
        let pickedCurrencyIndex = CurrencyPicker.selectedSegmentIndex
        defaults.set(pickedCurrencyIndex, forKey: "pickedCurrencyIndex")
        defaults.synchronize()

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view
        
        // Load the stored Settings
        let pickedCurrency = defaults.integer(forKey: "pickedCurrencyIndex")
        CurrencyPicker.selectedSegmentIndex = pickedCurrency
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}








/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */



