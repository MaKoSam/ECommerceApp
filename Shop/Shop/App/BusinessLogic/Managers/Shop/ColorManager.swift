//
//  ColorManager.swift
//  Shop
//
//  Created by Sam Mazniker on 01/05/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class ColorManager {
    private var colors = [Color]()
    
    func configureColors(completionHandler: @escaping () -> Void){
        restoreFromNetwork() { color in
            if let color = color {
                self.colors = color
                completionHandler()
            }
        }
    }
    
    private func restoreFromCache(completionHandler: @escaping ([Color]?) -> Void) {
        completionHandler(nil)
    }
    
    private func restoreFromNetwork(completionHandler: @escaping ([Color]?) -> Void) {
        let networkManager = ShopNetworkManager()
        networkManager.requestColors(){ colors in
            completionHandler(colors)
        }
    }
}

//Фильтрация и поиск
extension ColorManager {
    func getAll() -> [Color] {
        return colors
    }
    
    func getById(_ id: Int) -> Color? {
        for color in colors {
            if color.id == id {
                return color
            }
        }
        return nil
    }
    
    func getByName(_ name: String) -> [Color] {
        var returnColor = [Color]()
        for color in colors {
            if color.name.lowercased().contains(name.lowercased()){
                returnColor.append(color)
            }
        }
        return returnColor
    }
}
