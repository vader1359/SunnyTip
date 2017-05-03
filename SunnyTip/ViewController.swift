//
//  ViewController.swift
//  SunnyTip
//
//  Created by Vader1359 on 5/1/17.
//  Copyright © 2017 vader1359. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var sunControllerImg: UIImageView!
    @IBOutlet weak var billTf: UITextField!
    @IBOutlet weak var tipTf: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var eachPayerAmountLabel: UILabel!
    @IBOutlet weak var tipRateLabel: UILabel!
    @IBOutlet weak var numberOfPayersLabel: UILabel!
    @IBOutlet weak var updatingLabel: UILabel!
    
    // Events Handling
    @IBAction func calculateTip(_ sender: Any) {
        // Calculate and display the Tip Amount
        let bill = Double(billTf.text!) ?? 0
        let tipRate = Double(tipRateLabel.text!)! / 100
        let tipAmount = calculateTipAmountWith(bill: bill, tipRate: tipRate)
        
        
        // Calculate and display the tipAmount
        let defaults = UserDefaults.standard
        let pickedCurrency = defaults.string(forKey: "pickedCurrency")
        
        let formattedTipAmount = getFormattedCurrency(of: tipAmount, with: pickedCurrency!)
        tipTf.text = formattedTipAmount
        
        
        // Calculate and display the Total Payment
        let totalPayment = calculateTotalPaymentWith(bill: bill, tipAmount: tipAmount)
        let formattedTotalAmount = getFormattedCurrency(of: totalPayment, with: pickedCurrency!)
        totalLabel.text = formattedTotalAmount
//        totalLabel.text = String(format: "$%.1f", totalPayment)
        
        // Calculate and display Each Payer Amount
        let numberOfPayers = Int(numberOfPayersLabel.text!) ?? 0
        let eachPayerAmount = calculateEachPayerAmountWith(total: totalPayment, numberOfPayers: numberOfPayers)
        let formattedEachPayerAmount = getFormattedCurrency(of: eachPayerAmount, with: pickedCurrency!)
        eachPayerAmountLabel.text = "each: \(formattedEachPayerAmount)"
    }
    
    @IBAction func inputTip(_ sender: Any) {
        let bill = Double(billTf.text!) ?? 1
        let tipAmount = Double(tipTf.text!) ?? 0
        let tipRate = calculateTipRateFrom(tipAmount: tipAmount, bill: bill)
        
        tipRateLabel.text = String(tipRate)
        
    }
    
    // Stupid solution (add Button) -> need to use tap recognizer
    
    @IBAction func changeTipRate(_ sender: Any) {
        let tipRate = Double(tipRateLabel.text!)
        let updatedTipRate: Double = SunnyTip.changeRate(of: tipRate!)
        // Stupid solution (convert Double to Int)
        let updatedIntTipRate = Int(updatedTipRate)
        tipRateLabel.text = String(updatedIntTipRate)
    }
    @IBAction func changeNumberOfPayers(_ sender: Any) {
        let currentNumberOfPayers = Int(numberOfPayersLabel.text!)
        let updatedNumberOfPayers = SunnyTip.changeNumber(of: currentNumberOfPayers!)
        
        numberOfPayersLabel.text = String(updatedNumberOfPayers)
    }
    
    // Change theme function
    // Stupid handling with button
    
    var toggled = true
    @IBAction func changeTheme(_ sender: Any) {
        if toggled {
            (backgroundImg.image, sunControllerImg.image) = AppTheme.nightMode.setBackground()
            toggled = false
        } else {
            (backgroundImg.image, sunControllerImg.image) = AppTheme.dayMode.setBackground()
            toggled = true
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        billTf.becomeFirstResponder()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



// Function to calculate the Total Bill
func calculateTipAmountWith(bill: Double, tipRate: Double) -> Double {
    let tipAmount = bill * tipRate
    return tipAmount
    
}

func calculateTipRateFrom(tipAmount: Double, bill: Double) -> Double {
    if bill != 0 {
        let tipRate = tipAmount / bill * 100
        return tipRate
    } else {
        return 0
    }
}

func calculateTotalPaymentWith(bill: Double, tipAmount: Double) -> Double {
    let total = bill + tipAmount
    return total
}

// Function to calculate the amout each payer must pay
func calculateEachPayerAmountWith(total: Double, numberOfPayers: Int) -> Double {
    if numberOfPayers != 0 {
        let eachPayerAmount = total / Double(numberOfPayers)
        return eachPayerAmount
    } else {
        return 0
    }
}

func changeRate(of currentTipRate: Double) -> Double {
    var nextTipRate = currentTipRate + 5.0
    if 0...20 ~= nextTipRate {
        return nextTipRate
    } else {
        nextTipRate = 0.0
        return nextTipRate
    }
}

func changeNumber(of currentNumberOfPayers: Int) -> Int {
    var nextNumberOfPayers = currentNumberOfPayers + 1
    if 0...5 ~= nextNumberOfPayers {
        return nextNumberOfPayers
    } else {
        nextNumberOfPayers = 1
        return nextNumberOfPayers
    }
}

func getFormattedCurrency(of moneyToBeFormatted: Double, with currency: String) -> String {
    // Convert to String with Currency and thousand seperator
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.maximumFractionDigits = 1
    formatter.locale = Locale(identifier: currency)
    let formattedMoney = formatter.string(from: moneyToBeFormatted as NSNumber)
    return formattedMoney!
}




