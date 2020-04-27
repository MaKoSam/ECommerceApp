//
//  ShopCart.swift
//  Shop
//
//  Created by Sam Mazniker on 27/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class ShopCart {
    var items: [Int: Int] //ShopItem.ID + Quantity
    
    init() {
        self.items = [Int: Int]()
    }
}
