//
//  User.swift
//  Shop
//
//  Created by Sam Mazniker on 18/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class User: Codable {
    var username: String = ""
    var email: String = ""
    var accessToken: String?
    var refreshToken: String?
    var expires: Int?
}
