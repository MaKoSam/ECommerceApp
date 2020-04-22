//
//  Registrator.swift
//  Shop
//
//  Created by Sam Mazniker on 20/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import FirebaseAuth

class Registrator: NSObject {
    private var username = ""
    private var password = ""
    
    func signUp(with email: String, and password: String, completionHandler: @escaping(Error?) -> Void){
        self.set(username: email, and: password)
        self.registerAction(){ error in
            completionHandler(error)
        }
    }
    
    private func set(username: String, and password:String){
        self.username = username
        self.password = password
    }
    
    private func registerAction(completionHandler: @escaping(Error?) -> Void){
        Auth.auth().createUser(withEmail: username, password: password){ (user, error) in
            completionHandler(error)
        }
    }
}
