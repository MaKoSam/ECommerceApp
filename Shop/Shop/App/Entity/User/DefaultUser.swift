//
//  DefaultUser.swift
//  Shop
//
//  Created by Sam Mazniker on 18/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class DefaultUser: User {
    override init() {
        super.init()
        self.username = "guest"
        self.name = "гость"
        self.email = "guest@email.com"
        self.address = DefaultAddress()
    }
}
