//
//  Registrator.swift
//  Shop
//
//  Created by Sam Mazniker on 20/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import FirebaseAuth

class Registrator {
    private let networkConnection = AuthNetworkManager()
    
    func signUp(with username: String, password: String, email: String, completionHandler: @escaping(User?) -> Void){
        networkConnection.signUp(with: username, password: password, email: email) { user in
            completionHandler(user)
        }
    }
}
