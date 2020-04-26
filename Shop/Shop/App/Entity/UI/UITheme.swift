//
//  UITheme.swift
//  Shop
//
//  Created by Sam Mazniker on 27/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class UITheme: NSObject {
    var backgroundColor: UIColor
    var secondBackgroundColor: UIColor
    
    var buttonColor: UIColor
    var secondButtonColor: UIColor
    
    var textColorWhite: UIColor
    var textColorBlack: UIColor
    var secondTextColor: UIColor

    var cornerRadius: CGFloat
    
    var fontBig: UIFont
    var fontMedium: UIFont
    var fontSmall: UIFont
    
    init(backgroundColor: UIColor, buttonColor: UIColor, textColor: UIColor, font: UIFont){
        self.backgroundColor = backgroundColor
        self.secondBackgroundColor = backgroundColor
        self.buttonColor = buttonColor
        self.secondButtonColor = buttonColor
        self.textColorWhite = UIColor.white
        self.textColorBlack = UIColor.black
        self.secondTextColor = textColor
        self.fontBig = font
        self.fontMedium = font
        self.fontSmall = font
        self.cornerRadius = 5.0
    }
}
