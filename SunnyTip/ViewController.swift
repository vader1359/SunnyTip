//
//  ViewController.swift
//  SunnyTip
//
//  Created by Vader1359 on 5/1/17.
//  Copyright © 2017 vader1359. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    
    // ViewGroups for animation
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var highHillView: UIView!
    @IBOutlet weak var shortHillView: UIView!
    
    
    // UIElements
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var shortHillImg: UIImageView!
    @IBOutlet weak var highHillImg: UIImageView!
    @IBOutlet weak var billTf: UITextField!
    //    @IBOutlet weak var tipTf: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var eachPayerAmountLabel: UILabel!
    @IBOutlet weak var tipRateLabel: UILabel!
    @IBOutlet weak var numberOfPayersLabel: UILabel!
    @IBOutlet weak var updatingLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    //
    
    // Events Handling
    @IBAction func calculateTip(_ sender: Any) {
        updateDisplays()
    }
    
    // Stupid solution (add Button) -> need to use tap recognizer
    
    @IBAction func changeTipRate(_ sender: Any) {
        let tipRate = Double(tipRateLabel.text!)
        let updatedTipRate: Double = SunnyTip.changeRate(of: tipRate!)
        // Stupid solution (convert Double to Int)
        let updatedIntTipRate = Int(updatedTipRate)
        tipRateLabel.text = String(updatedIntTipRate)
        updateDisplays()
        
        // FIXME: Still don't know how to do this function
        self.updatingLabel.isHidden = false
        updatingLabel.text = tipRateLabel.text
        let when = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.updatingLabel.isHidden = true
        }
        
        
        
    }
    
    @IBAction func changeNumberOfPayers(_ sender: Any) {
        let currentNumberOfPayers = Int(numberOfPayersLabel.text!)
        let updatedNumberOfPayers = SunnyTip.changeNumber(of: currentNumberOfPayers!)
        
        numberOfPayersLabel.text = String(updatedNumberOfPayers)
        updateDisplays()
        
        self.updatingLabel.isHidden = false
        updatingLabel.text = numberOfPayersLabel.text
        let when = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.updatingLabel.isHidden = true
        }
    }
    
    // Change theme function
    // Stupid handling with button
    
    var themeToggled = true
    @IBAction func changeTheme(_ sender: Any) {
        if themeToggled {
            (backgroundImg.image, shortHillImg.image, highHillImg.image) = AppTheme.nightMode.setBackground()
            themeToggled = false
        } else {
            (backgroundImg.image, shortHillImg.image, highHillImg.image) = AppTheme.dayMode.setBackground()
            themeToggled = true
        }
        
    }
    
    func clearDisplay() {
        self.billTf.text = "0"
    }
    
    func saveDisplay() {
        defaults.set(billTf.text, forKey: "oldBill")
        defaults.set(tipRateLabel.text, forKey: "oldTipRate")
        defaults.set(numberOfPayersLabel.text, forKey: "oldNumberOfPlayers")
    }
    
    func loadDisplay() {
        self.billTf.text = defaults.string(forKey: "oldBill")
        self.tipRateLabel.text = defaults.string(forKey: "oldTipRate")
        self.numberOfPayersLabel.text = defaults.string(forKey: "oldNumberOfPlayers")
        
    }
    
    func updateDisplays() {
        // Prevent zero leading input
        if billTf.text == "0" {
            billTf.text = ""
        }
        let bill = Double(billTf.text!) ?? 0
        let tipRate = Double(tipRateLabel.text!)! / 100
        let tipAmount = calculateTipAmountWith(bill: bill, tipRate: tipRate)
        
        
        
        let formattedTipAmount = getFormattedCurrency(of: tipAmount)
        tipLabel.text = String(formattedTipAmount)
        
        
        // Calculate and display the Total Payment
        let totalPayment = calculateTotalPaymentWith(bill: bill, tipAmount: tipAmount)
        let formattedTotalPayment = getFormattedCurrency(of: totalPayment)
        totalLabel.text = String(formattedTotalPayment)
        
        // Calculate and display Each Payer Amount
        let numberOfPayers = Int(numberOfPayersLabel.text!) ?? 0
        let eachPayerAmount = calculateEachPayerAmountWith(total: totalPayment, numberOfPayers: numberOfPayers)
        let formattedEachPayerAmount = getFormattedCurrency(of: eachPayerAmount)
        eachPayerAmountLabel.text = String(formattedEachPayerAmount)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        highHillView.center.y += view.bounds.height
        shortHillView.center.y += view.bounds.height
        
    }
    
    // Animation
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.highHillView.center.y -= self.view.bounds.height
        }
        UIView.animate(withDuration: 0.3, delay: 0.1, options: [], animations: {
            self.shortHillView.center.y -= self.view.bounds.height
        },
                       completion: nil
        )
        updateDisplays()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billTf.becomeFirstResponder()
        let lastCalculatedTime = defaults.integer(forKey: "lastCalculatedTime")
        let openTime = Int(Date().timeIntervalSince1970)
        let lastDuration = (openTime - lastCalculatedTime)
        if lastDuration <= 10 {
            loadDisplay()
        } else {
            clearDisplay()
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let lastCalculatedTime = Int(Date().timeIntervalSince1970)
        defaults.set(lastCalculatedTime, forKey: "lastCalculatedTime")
        saveDisplay()
    }
    
}






