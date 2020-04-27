//
//  UserSaver.swift
//  Shop
//
//  Created by Sam Mazniker on 18/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation
import RealmSwift

final class UserSaver {
    func getUser() -> User? {
        do {
            let realm = try! Realm()
            let user = realm.objects(User.self).first
            return user
        } catch {
            return nil
        }
    }
    
    func saveUser(user: User) {
        do {
            let realm = try! Realm()
            print(realm.configuration.fileURL)
            try realm.write {
                realm.deleteAll()
                realm.add(user)
            }
        } catch {
        }
    }
    
    func deleteUser() {
        do {
            let realm = try! Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch {
        }
    }
}
