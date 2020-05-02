//
//  ShopParser.swift
//  Shop
//
//  Created by Sam Mazniker on 30/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation
import Alamofire

final class ShopParser {
    func parseItems(from request: DataRequest, completionHandler: @escaping ([ShopItem]?) -> Void) {
        request.responseDecodable(of: ItemsResponse.self){ result in
            if result.error == nil {
                guard let shopItems = result.value?.items else {
                    completionHandler(nil)
                    return
                }
                var returnShopItems = [ShopItem]()
                for item in shopItems {
                    let builder = ItemBuilder()
                    returnShopItems.append(builder.buildItem(from: item))
                }
                completionHandler(returnShopItems)
                return
            }
            completionHandler(nil)
        }
    }
    
    func parseCategories(from request: DataRequest, completionHandler: @escaping ([Category]?) -> Void) {
        request.responseDecodable(of: CategoryResponse.self){ result in
            if result.error == nil {
                guard let categories = result.value?.categories else {
                    completionHandler(nil)
                    return
                }
                completionHandler(categories)
                return
            }
        }
        completionHandler(nil)
    }
    
    func parseColors(from request: DataRequest, completionHandler: @escaping ([Color]?) -> Void) {
        request.responseDecodable(of: ColorResponse.self){ result in
            if result.error == nil {
                guard let colors = result.value?.colors else {
                    completionHandler(nil)
                    return
                }
                completionHandler(colors)
                return
            }
        }
        completionHandler(nil)
    }
    
    func parseSizes(from request: DataRequest, completionHandler: @escaping ([Size]?) -> Void) {
        request.responseDecodable(of: SizeResponse.self){ result in
            if result.error == nil {
                guard let sizes = result.value?.sizes else {
                    completionHandler(nil)
                    return
                }
                completionHandler(sizes)
                return
            }
        }
        completionHandler(nil)
    }
}
