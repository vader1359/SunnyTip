//
//  EnumManager.swift
//  SunnyTip
//
//  Created by Vader1359 on 5/21/17.
//  Copyright © 2017 vader1359. All rights reserved.
//

import Foundation

import UIKit


// MARK: List of themes available

enum AppTheme {
    case dayMode
    case nightMode
    
//    func changeTextColor(of textViews: [UILabel]) {
//        for view in textViews {
//            switch self {
//            case .dayMode():
//                view.textColor = UIColor.black
//            case .nightMode():
//                view.textColor = UIColor.white
//            }
//        }
//    }
    
    func setBackground() -> (backgroundImg: UIImage?, shortHillImg: UIImage?, highHillImg: UIImage?) {
        switch self {
            
        case .dayMode():
            let backgroundImg = #imageLiteral(resourceName: "day_background")
            let shortHillImg = #imageLiteral(resourceName: "day_short_hill")
            let highHillImg = #imageLiteral(resourceName: "day_high_hill")
            return (backgroundImg, shortHillImg, highHillImg)
            
        case .nightMode():
            let backgroundImg = #imageLiteral(resourceName: "night_background")
            let shortHillImg = #imageLiteral(resourceName: "night_short_hill")
            let highHillImg = #imageLiteral(resourceName: "night_high_hill")
            return (backgroundImg, shortHillImg, highHillImg)
            
        }
    }
    

}

// MARK: List of currencies available

enum Currency {
    case USD
    case Yen
    
    func getCurrencyIdentifier() -> String {
        switch self {
        case .USD: return "en_US"
        case .Yen: return "ja_JP"
        }
    }
}





