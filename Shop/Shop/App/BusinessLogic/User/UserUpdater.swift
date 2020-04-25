//
//  UserUpdater.swift
//  Shop
//
//  Created by Sam Mazniker on 18/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class UserUpdater: NSObject {
    func setUsername(username: String, for user: User) -> User{
        user.username = username
        return user
    }
    
    func setName(name: String, for user: User) -> User{
        user.name = name
        return user
    }
    
    func setEmail(mail: String, for user: User) -> User{
        user.email = mail
        return user
    }
    
    func setAddress(address: Address, for user: User) -> User{
        user.address = address
        return user
    }
    
    func setPhone(phone: String, for user: User) -> User{
        user.phone = phone
        return user
    }

}
