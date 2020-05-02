//
//  Authorizator.swift
//  Shop
//
//  Created by Sam Mazniker on 20/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class Authorizator {
    func signIn(with username: String, password: String, completionHandler: @escaping (User?) -> Void) {
        let networkConnection = AuthNetworkManager()
        networkConnection.signIn(with: username, password: password) { user in
            completionHandler(user)
        }
    }
    
    func refreshToken(with refreshToken: String, completionHandler: @escaping (User?) -> Void) {
        let networkConnection = AuthNetworkManager()
        networkConnection.refreshToken(with: refreshToken) { user in
            completionHandler(user)
        }
    }
}
