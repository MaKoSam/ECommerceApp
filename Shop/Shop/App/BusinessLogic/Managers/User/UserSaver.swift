//
//  UserSaver.swift
//  Shop
//
//  Created by Sam Mazniker on 18/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class UserSaver {
    func getUserFromCache() -> User? {
        let decoder = JSONDecoder()
        let cacheFolder = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let userFolder = cacheFolder.appendingPathComponent("user.txt")
        let data = FileManager.default.contents(atPath: userFolder.path)
        guard let executedData = data else {
            return nil
        }
        return try? decoder.decode(User.self, from: executedData)
    }
    
    func saveUserToCache(user: User) {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(user) {
            let cacheFolder = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
            let userFolder = cacheFolder.appendingPathComponent("user.txt")
            let _ = FileManager.default.createFile(atPath: userFolder.path, contents: encodedData)
        }
    }
}
