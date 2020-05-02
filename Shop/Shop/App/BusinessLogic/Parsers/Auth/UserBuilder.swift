//
//  UserBuilder.swift
//  Shop
//
//  Created by Sam Mazniker on 02/05/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class UserBuilder {
    func buildUser(from user: UserResponse?) -> User? {
        guard let username = user?.username,
            let email = user?.email,
            let accessToken = user?.accessToken,
            let refreshToken = user?.refreshToken,
            let expires = user?.expires else {
                return nil
        }
        let returnUser = User()
        returnUser.username = username
        returnUser.email = email
        returnUser.accessToken = accessToken
        returnUser.refreshToken = refreshToken
        returnUser.expires = expires
        return returnUser
    }
}
