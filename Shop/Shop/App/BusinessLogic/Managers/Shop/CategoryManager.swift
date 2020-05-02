//
//  CategoryManager.swift
//  Shop
//
//  Created by Sam Mazniker on 01/05/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class CategoryManager {
    private var categories = [Category]()
    
    func configureCategories(completionHandler: @escaping () -> Void){
        restoreFromNetwork() { category in
            if let category = category {
                self.categories = category
                completionHandler()
            }
        }
    }
    
    private func restoreFromCache(completionHandler: @escaping ([Category]?) -> Void) {
        completionHandler(nil)
    }
    
    private func restoreFromNetwork(completionHandler: @escaping ([Category]?) -> Void) {
        let networkManager = ShopNetworkManager()
        networkManager.requestCategories(){ categories in
            completionHandler(categories)
        }
    }
}

//Фильтрация и поиск
extension CategoryManager {
    func getAll() -> [Category] {
        return categories
    }
    
    func getById(_ id: Int) -> Category? {
        for category in categories {
            if category.id == id {
                return category
            }
        }
        return nil
    }
    func getByName(_ name: String) -> [Category] {
        var returnCategory = [Category]()
        for category in categories {
            if category.name.lowercased().contains(name.lowercased()) {
                returnCategory.append(category)
            }
        }
        return returnCategory
    }

}
