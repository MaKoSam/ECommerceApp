//
//  ShopItemManager.swift
//  Shop
//
//  Created by Sam Mazniker on 27/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class ShopItemManager {
    static let shared = ShopItemManager()
    private init() { }
    
    private var items = [ShopItem]()
    
    func requestShopItems(page: Int, completionHandler: @escaping () -> Void) {
        let networkManager = ShopItemNetworkManager()
        networkManager.requestShopItems(page: page){ shopItems in
            guard let shopItems = shopItems else {
                completionHandler()
                return
            }
            self.items.append(contentsOf: shopItems)
            completionHandler()
        }
    }
    
    func getAll() -> [ShopItem]{
        return self.items
    }
    
    func getItemById(_ id: Int) -> ShopItem? {
        for item in self.items {
            if item.id == id {
                return item
            }
        }
        return nil
    }
    
    func isValidItemID(_ id: Int) -> Bool {
        for item in self.items {
            if item.id == id {
                return true
            }
        }
        return false
    }
}
