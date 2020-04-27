//
//  ShopCartManager.swift
//  Shop
//
//  Created by Sam Mazniker on 27/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class ShopCartManager {
    private var shopCart = ShopCart()
    
    func getItemsInCart() -> [ShopItem] {
        var cartItemList = [ShopItem]()
        for ID: Int in shopCart.items.keys {
            if let shopItem = ShopItemManager.shared.getItemById(ID) {
                cartItemList.append(shopItem)
            }
        }
        return cartItemList
    }
    
    func addItemToCart(item id: Int) {
        if ShopItemManager.shared.isValidItemID(id){
            if let quantity = shopCart.items[id] {
                shopCart.items.updateValue(quantity + 1, forKey: id)
            }
            shopCart.items.updateValue(1, forKey: id)
        }
    }
    
    func removeItemFromCart(item id: Int) {
        if let quantity = shopCart.items[id] {
            if (quantity - 1) <= 0 {
                shopCart.items.removeValue(forKey: id)
                return
            }
            shopCart.items.updateValue(quantity - 1, forKey: id)
        }
    }
}
