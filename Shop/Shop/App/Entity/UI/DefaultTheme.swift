//
//  DefaultTheme.swift
//  Shop
//
//  Created by Sam Mazniker on 26/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation
import UIKit

final class DefaultTheme: UITheme {
    
    init() {
        super.init(backgroundColor: UIColor.white, buttonColor: UIColor.white, textColor: UIColor.white, font: UIFont())
        backgroundColor = UIColor(red: 0.11, green: 0.12, blue: 0.15, alpha: 1.0)
        secondBackgroundColor = UIColor(red: 0.16, green: 0.17, blue: 0.21, alpha: 1.0)
        
        buttonColor = UIColor(red: 0.93, green: 0.31, blue: 0.21, alpha: 1.0)
        secondButtonColor = UIColor.blue
        
        textColorWhite = UIColor.white
        textColorBlack = UIColor.black
        secondTextColor = UIColor(red: 0.67, green: 0.70, blue: 0.74, alpha: 1.0)

        cornerRadius = 5.0
        
        fontBig = UIFont(name: "HelveticaNeue-Bold", size: 30.0)!
        fontMedium = UIFont(name: "HelveticaNeue", size: 20.0)!
        fontSmall = UIFont(name: "HelveticaNeue", size: 14.0)!
    }
    
}
