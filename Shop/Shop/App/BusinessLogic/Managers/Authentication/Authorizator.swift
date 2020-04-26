//
//  Authorizator.swift
//  Shop
//
//  Created by Sam Mazniker on 20/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class Authorizator {
    private let networkConnection = AuthNetworkManager()
    
    func signIn(with username: String, password: String, completionHandler: @escaping (User?) -> Void) {
        networkConnection.signIn(with: username, password: password) { user in
            completionHandler(user)
        }
    }
    
    func refreshToken(for user: User, completionHandler: @escaping (User?) -> Void) {
        completionHandler(nil)
    }

}
