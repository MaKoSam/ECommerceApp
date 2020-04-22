//
//  Authorizator.swift
//  Shop
//
//  Created by Sam Mazniker on 20/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import FirebaseAuth

class Authorizator: NSObject {
    private var username = ""
    private var password = ""
    
    func signIn(with email: String, password: String, completionHandler: @escaping (Error?) -> Void){
        self.set(username: email, and: password)
        self.loginAction(){ error in
            completionHandler(error)
        }
    }
    
    private func set(username: String, and password:String){
        self.username = username
        self.password = password
    }
    
    private func loginAction(completionHandler: @escaping (Error?) -> Void){
        Auth.auth().signIn(withEmail: username, password: password) { (user, error) in
            completionHandler(error)
        }
    }

}
