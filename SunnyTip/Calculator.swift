
import UIKit


// Function to calculate the Total Bill
func calculateTipAmountWith(bill: Double, tipRate: Double) -> Double {
    let tipAmount = bill * tipRate
    return tipAmount
    
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
    if 0...9 ~= nextNumberOfPayers {
        return nextNumberOfPayers
    } else {
        nextNumberOfPayers = 1
        return nextNumberOfPayers
    }
}

func getFormattedCurrency(of moneyToBeFormatted: Double) -> String {
    // Convert to String with Currency and thousand seperator
    
    let defaults = UserDefaults.standard
    let pickedCurrencyIndex = defaults.integer(forKey: "pickedCurrencyIndex")
    
    let currencies = [Currency.getCurrencyIdentifier(.USD),
                      Currency.getCurrencyIdentifier(.Yen)]
    
    let currencyIdentifier = currencies[pickedCurrencyIndex]
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.maximumFractionDigits = 1
    formatter.locale = Locale(identifier: currencyIdentifier())
    let formattedMoney = formatter.string(from: moneyToBeFormatted as NSNumber)
    return formattedMoney!
}

// Function to update all Results

