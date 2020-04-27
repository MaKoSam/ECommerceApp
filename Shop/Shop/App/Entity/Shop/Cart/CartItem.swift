//
//  CartItem.swift
//  Shop
//
//  Created by Sam Mazniker on 27/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class CartItem {
    var itemId: Int
    var quantity: Int
    
    init(for itemId: Int){
        self.itemId = itemId
        self.quantity = 1
    }
}
