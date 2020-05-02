//
//  Color.swift
//  Shop
//
//  Created by Sam Mazniker on 30/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class Color: Codable {
    var id: Int
    var name: String
    var red: Double?
    var green: Double?
    var blue: Double?
    
    init(id: Int, name: String){
        self.id = id
        self.name = name
    }
}
