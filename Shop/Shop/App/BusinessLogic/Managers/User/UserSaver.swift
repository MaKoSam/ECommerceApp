//
//  UserSaver.swift
//  Shop
//
//  Created by Sam Mazniker on 18/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class UserSaver {
    
    func getUserFromCache() -> User?{
        let cacheFolder = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let userFolder = cacheFolder.appendingPathComponent("user.txt")
        print(userFolder.path)
        let data = FileManager.default.contents(atPath: userFolder.path)
        print(data)
        guard let executedData = data else {
            return nil
        }
        let decoder = JSONDecoder()
        
        return try? decoder.decode(User.self, from: executedData)
    }
    
    func saveUserToCache(user: User) {
        print("Now to saving\n")
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(user) {
            let cacheFolder = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
            let userFolder = cacheFolder.appendingPathComponent("user.txt")
            print(userFolder.path)
            let result = FileManager.default.createFile(atPath: userFolder.path, contents: encodedData)
            print(result)
        }
        
    }
    
}
