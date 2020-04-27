//
//  UserBuilder.swift
//  Shop
//
//  Created by Sam Mazniker on 18/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class UserManager {
    private let saver = UserSaver()
    
    func getUser() -> User? {
        if let user = saver.getUser(){
            return user
        } else {
            return nil
        }
    }
    
    func saveUser(user: User) {
        saver.saveUser(user: user)
    }
    
    func logout(){
        saver.deleteUser()
    }
    
    private func makeUser() -> User{
        return User()
    }
    
    private func makeDefaultUser() -> User{
        let user = makeUser()
        user.username = "Guest"
        user.email = "not@email.ru"
        return user
    }
}
