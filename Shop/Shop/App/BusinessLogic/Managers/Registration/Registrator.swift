//
//  Registrator.swift
//  Shop
//
//  Created by Sam Mazniker on 20/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class Registrator {
    func signUp(with username: String, password: String, email: String, completionHandler: @escaping(User?) -> Void){
        let networkConnection = AuthNetworkManager()
        networkConnection.signUp(with: username, password: password, email: email) { user in
            completionHandler(user)
        }
    }
}
