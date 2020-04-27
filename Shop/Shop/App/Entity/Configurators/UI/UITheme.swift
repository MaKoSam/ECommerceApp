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

    var viewCornerRadius: CGFloat
    var buttonCornerRadius: CGFloat
    
    var fontBig: UIFont
    var fontMedium: UIFont
    var fontSmall: UIFont
    
    override init(){
        self.backgroundColor = UIColor()
        self.secondBackgroundColor = UIColor()
        self.buttonColor = UIColor()
        self.secondButtonColor = UIColor()
        self.textColorWhite = UIColor.white
        self.textColorBlack = UIColor.black
        self.secondTextColor = UIColor()
        self.viewCornerRadius = 5.0
        self.buttonCornerRadius = 25.0
        self.fontBig = UIFont()
        self.fontSmall = UIFont()
        self.fontMedium = UIFont()
    }
}
