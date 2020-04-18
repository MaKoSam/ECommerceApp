//
//  DefaultAddress.swift
//  Shop
//
//  Created by Sam Mazniker on 18/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class DefaultAddress: Address {
    override init() {
        super.init()
        self.country = "Введите название страны.."
        self.city = "Введите название города..."
        self.line1 = "Введите название улицы..."
    }
}

