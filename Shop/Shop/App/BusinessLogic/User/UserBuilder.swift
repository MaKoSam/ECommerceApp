//
//  UserBuilder.swift
//  Shop
//
//  Created by Sam Mazniker on 18/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class UserBuilder: NSObject {
    private let userUpdated = UserUpdater()
    
    private func makeUser() -> User{
        return User()
    }
    
    private func passSecurityCheck(user: User) -> Bool{
        if(user.username != ""){
            if(user.name != ""){
                if(user.email != ""){
                    return true
                }
            }
        }
        return false
    }
    
    func buildDefaultUser() -> User?{
        var user = makeUser()
        user = DefaultUser()
        if(passSecurityCheck(user: user)){
            return user
        }
        return nil
    }
    
    func buildUserFromDictionary(dictionary: [String: Any]) -> User?{
        var user = makeUser()
        
        if let username = dictionary["username"] as? String{
            user = userUpdated.setUsername(username: username, for: user)
        }
        
        if let name = dictionary["name"] as? String{
            user = userUpdated.setName(name: name, for: user)
        }
        if let mail = dictionary["email"] as? String{
            user = userUpdated.setEmail(mail: mail, for: user)
        }
        if let phone = dictionary["phone"] as? String{
            user = userUpdated.setPhone(phone: phone, for: user)
        }
        
        if let addressDictionary = dictionary["address"] as? [String: String]{
            let addressBuilder = AddressBuilder()
            let addressObject = addressBuilder.buildAddressFromDictionary(dictionary: addressDictionary)
            if let address = addressObject{
                user = userUpdated.setAddress(address: address, for: user);
            }
        }
        
        if(passSecurityCheck(user: user)){
            return user;
        }
        return nil;
    }

}
