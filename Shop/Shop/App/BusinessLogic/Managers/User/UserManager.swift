//
//  UserBuilder.swift
//  Shop
//
//  Created by Sam Mazniker on 18/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class UserManager {
    private let saver = UserSaver()
    
    func getUser() -> User? {
        if let user = saver.getUserFromCache(){
            return user
        } else {
            return nil
        }
    }
    
    func saveUser(user: User) {
        saver.saveUserToCache(user: user)
    }
    
    private func makeUser() -> User{
        return User()
    }
    
    func makeDefaultUser() -> User{
        let user = makeUser()
        user.username = "Guest"
        user.email = "not@email.ru"
        return user
    }
    
    func makeUserFromDictionary(dictionary: [String: Any]) -> User{
        let user = makeUser()
        
        if let username = dictionary["username"] as? String {
            user.username = username
        }
        
        if let mail = dictionary["email"] as? String {
            user.email = mail
        }
        
        if let accessToken = dictionary["accessToken"] as? String {
            user.accessToken = accessToken
        }
        
        if let refreshToken = dictionary["refreshToken"] as? String {
            user.refreshToken = refreshToken
        }
        
        if let tokenExpire = dictionary["expiresAt"] as? Int {
            user.expires = tokenExpire
        }
        
        return user;
    }

}
