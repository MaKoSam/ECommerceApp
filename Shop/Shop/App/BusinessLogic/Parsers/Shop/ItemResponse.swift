//
//  ItemResponse.swift
//  Shop
//
//  Created by Sam Mazniker on 30/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class ItemsResponse: Codable{
    var items: [encodedItem]
}

final class encodedItem: Codable{
    var id: Int?
    var name: String
    var price: Int
    //    var description: String
    var colors: [Int]?
    var sizes: [Int]?
    var tags: [Int]?
}
