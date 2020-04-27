//
//  Authorization.swift
//  Shop
//
//  Created by Sam Mazniker on 25/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation
import Alamofire

final class AuthNetworkManager {
    func signIn(with username: String, password: String, completionHandler: @escaping (User?) -> Void){
        let parameters = ["username": username,
                          "password": password]
        let request = AF.request("http://localhost:8080/auth/sign_in", method: .post, parameters: parameters)
        
        request.responseDecodable(of: UserResponse.self){ result in
            if result.error == nil {
                guard let username = result.value?.username,
                    let email = result.value?.email,
                    let accessToken = result.value?.accessToken,
                    let refreshToken = result.value?.refreshToken,
                    let expires = result.value?.expires else {
                        completionHandler(nil)
                        return
                }
                let user = User()
                user.username = username
                user.email = email
                user.accessToken = accessToken
                user.refreshToken = refreshToken
                user.expires = expires
                
                completionHandler(user)
                return
            }
            completionHandler(nil)
        }
    }
    
    func signUp(with username: String, password: String, email: String, completionHandler: @escaping (User?) -> Void){
        let parameters = ["username": username,
                          "password": password,
                          "email": email]
        let request = AF.request("http://localhost:8080/auth/register", method: .post, parameters: parameters)
        
        request.responseDecodable(of: UserResponse.self){ result in
            if result.error == nil {
                guard let username = result.value?.username,
                    let email = result.value?.email,
                    let accessToken = result.value?.accessToken,
                    let refreshToken = result.value?.refreshToken,
                    let expires = result.value?.expires else {
                        completionHandler(nil)
                        return
                }
                let user = User()
                user.username = username
                user.email = email
                user.accessToken = accessToken
                user.refreshToken = refreshToken
                user.expires = expires
                
                completionHandler(user)
                return
            }
            completionHandler(nil)
        }
    }
}
