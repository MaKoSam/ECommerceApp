//
//  ShopItemManager.swift
//  Shop
//
//  Created by Sam Mazniker on 27/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class ItemManager {
    private var items = [ShopItem]()
    
    func configureItems(page: Int = 1, completionHandler: @escaping () -> Void) {
        restoreFromNetwork() { item in
            if let item = item {
                self.items = item
                completionHandler()
            }
        }
    }
    
    private func restoreFromCache(completionHandler: @escaping ([ShopItem]?) -> Void) {
        completionHandler(nil)
    }
    
    private func restoreFromNetwork(completionHandler: @escaping ([ShopItem]?) -> Void) {
        let networkManager = ShopNetworkManager()
        networkManager.requestShopItems(page: 1){ items in
            completionHandler(items)
        }
    }
}

//Фильтрация и поиск
extension ItemManager {
    func getAll() -> [ShopItem] {
        return items
    }
    
    func getById(_ id: Int) -> ShopItem? {
        for item in self.items {
            if item.id == id {
                return item
            }
        }
        return nil
    }
    
    func getByCategory(_ category: Category) -> [ShopItem] {
        var returnItems = [ShopItem]()
        for item in self.items {
            if let categories = item.category {
                for element in categories {
                    if element.id == category.id {
                        returnItems.append(item)
                    }
                }
            }
        }
        return returnItems
    }
    
    func getBySize(_ size: Size) -> [ShopItem] {
        var returnItems = [ShopItem]()
        for item in self.items {
            if let sizes = item.sizes {
                for element in sizes {
                    if element.id == size.id {
                        returnItems.append(item)
                    }
                }
            }
        }
        return returnItems
    }
    
    func getByName(_ name: String) -> [ShopItem] {
        var returnItems = [ShopItem]()
        for item in self.items {
            if item.name.lowercased().contains(name.lowercased()) {
                returnItems.append(item)
            }
        }
        return returnItems
    }
    
    func getByColor(_ color: Color) -> [ShopItem] {
        var returnItems = [ShopItem]()
        for item in self.items {
            if let colors = item.colors {
                for element in colors {
                    if element.id == color.id {
                        returnItems.append(item)
                    }
                }
            }
        }
        return returnItems
    }
}
