//
//  ShopItemNetworkManager.swift
//  Shop
//
//  Created by Sam Mazniker on 27/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//  Запросы к серверу на получение товаров

import Foundation
import Alamofire

class ItemsResponse: Codable{
    var items: [ShopItem]
}

final class ShopItemNetworkManager {
    func requestShopItems(page: Int, completionHandler: @escaping ([ShopItem]?) -> Void) {
        let parameters = ["page": "1",
                          "accessToken": Session.shared.accessToken()] as [String : Any]
        let request = AF.request("http://localhost:8080/shop_items/get", method: .post, parameters: parameters)

        request.responseDecodable(of: ItemsResponse.self){ result in
            if result.error == nil {
                guard let shopItems = result.value?.items else {
                    completionHandler(nil)
                    return
                }
                completionHandler(shopItems)
                return
            }
            completionHandler(nil)
        }
    }
}
