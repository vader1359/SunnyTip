//
//  SettingsViewController.swift
//  SunnyTip
//
//  Created by Vader1359 on 5/1/17.
//  Copyright © 2017 vader1359. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var CurrencyLabel: UILabel!
    @IBOutlet weak var CurrencyPicker: UISegmentedControl!
    
        let currencies = [Currency.getCurrencyIdentifier(.USD),
                          Currency.getCurrencyIdentifier(.Yen)]
    
    @IBAction func pickCurrency(_ sender: Any) {
        let pickedCurrency = currencies[CurrencyPicker.selectedSegmentIndex]
        let defaults = UserDefaults.standard
        defaults.set(pickedCurrency(), forKey: "pickedCurrency")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

