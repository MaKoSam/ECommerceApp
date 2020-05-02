//
//  ShopManager.swift
//  Shop
//
//  Created by Sam Mazniker on 01/05/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class ShopManager {
    let itemManager = ItemManager()
    let categoryManager = CategoryManager()
    let sizeManager = SizeManager()
    let colorManager = ColorManager()
    
    func configureShop(completionHandler: @escaping () -> Void) {
        categoryManager.configureCategories {
            self.sizeManager.configureSizes {
                self.colorManager.configureColors {
                    self.itemManager.configureItems() {
                        completionHandler()
                    }
                }
            }
        }
    }
}
