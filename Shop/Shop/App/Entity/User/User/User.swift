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

class UserResponse: Codable {
    var username: String?
    var email: String?
    var accessToken: String?
    var refreshToken: String?
    var expires: Int?
}
