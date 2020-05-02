//
//  ShopItem.swift
//  Shop
//
//  Created by Sam Mazniker on 27/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class ShopItem: Codable {
    var id: Int?
    var name: String
    var price: Int
//    var description: String
    var category: [Category]?
    var colors: [Color]?
    var sizes: [Size]?
    
    init() {
        name = ""
        price = 0
    }
}
