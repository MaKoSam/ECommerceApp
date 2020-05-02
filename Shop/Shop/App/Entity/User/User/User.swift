//
//  User.swift
//  Shop
//
//  Created by Sam Mazniker on 18/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit
import RealmSwift

class User: Object {
    @objc dynamic var username = ""
    @objc dynamic var email = ""
    @objc dynamic var accessToken = ""
    @objc dynamic var refreshToken = ""
    @objc dynamic var expires = 0
}
