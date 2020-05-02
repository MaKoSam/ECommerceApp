//
//  SizeManager.swift
//  Shop
//
//  Created by Sam Mazniker on 01/05/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class SizeManager {
    private var sizes = [Size]()
    
    func configureSizes(completionHandler: @escaping () -> Void){
        restoreFromNetwork() { size in
            if let size = size {
                self.sizes = size
                completionHandler()
            }
        }
    }
    
    private func restoreFromCache(completionHandler: @escaping ([Size]?) -> Void) {
        completionHandler(nil)
    }
    
    private func restoreFromNetwork(completionHandler: @escaping ([Size]?) -> Void) {
        let networkManager = ShopNetworkManager()
        networkManager.requestSizes(){ sizes in
            completionHandler(sizes)
        }
    }
}

//Фильтрация и поиск
extension SizeManager {
    func getAll() -> [Size] {
        return sizes
    }
    
    func getById(_ id: Int) -> Size? {
        for size in sizes {
            if size.id == id {
                return size
            }
        }
        return nil
    }
    
    func getByName(_ name: String) -> [Size] {
        var returnSize = [Size]()
        for size in sizes {
            if size.name.lowercased().contains(name.lowercased()) {
                returnSize.append(size)
            }
        }
        return returnSize
    }
}
