//
//  ItemBuilder.swift
//  Shop
//
//  Created by Sam Mazniker on 02/05/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

final class ItemBuilder {
    func buildItem(from item: encodedItem) -> ShopItem {
        let returnItem = ShopItem()
        returnItem.id = item.id
        returnItem.name = item.name
        returnItem.price = item.price
        //returnItem.description = item.description
        
        returnItem.category = configureCategories(from: item.tags)
        returnItem.sizes = configureSizes(from: item.sizes)
        returnItem.colors = configureColors(from: item.colors)
        return returnItem
    }
    
    private func configureCategories(from ids: [Int]?) -> [Category]? {
        guard let ids = ids else {
            return nil
        }
        var returnCategories = [Category]()
        for id in ids {
            if let category = Session.shared.shopManager.categoryManager.getById(id) {
                returnCategories.append(category)
            }
        }
        return returnCategories
    }
    
    private func configureColors(from ids: [Int]?) -> [Color]? {
        guard let ids = ids else {
            return nil
        }
        var returnColors = [Color]()
        for id in ids {
            if let color = Session.shared.shopManager.colorManager.getById(id) {
                returnColors.append(color)
            }
        }
        return returnColors
    }
    
    private func configureSizes(from ids: [Int]?) -> [Size]? {
        guard let ids = ids else {
            return nil
        }
        var returnSizes = [Size]()
        for id in ids {
            if let size = Session.shared.shopManager.sizeManager.getById(id) {
                returnSizes.append(size)
            }
        }
        return returnSizes
    }
}
