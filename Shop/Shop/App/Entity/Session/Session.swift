//
//  Session.swift
//  Shop
//
//  Created by Sam Mazniker on 21/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class Session {
    static let shared = Session()
    private init(){ }
    
    private var user = User()
    var theme: UITheme = DefaultTheme()
    var translations = [String: String]()
    
    func isLoggedIn() -> Bool{
        let userBuilder = UserManager()
        if let cacheUser = userBuilder.getUser(){
            self.user = cacheUser
            return true
        }
        return false
    }
    
    func setUser(_ user: User){
        self.user = user
    }
}
