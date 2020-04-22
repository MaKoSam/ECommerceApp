//
//  Session.swift
//  Shop
//
//  Created by Sam Mazniker on 21/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class Session {
    static let shared = Session()
    private init(){ }
    
    var translations = [String: String]()
}
