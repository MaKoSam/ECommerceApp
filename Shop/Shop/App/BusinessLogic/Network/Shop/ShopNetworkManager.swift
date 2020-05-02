//
//  ShopItemNetworkManager.swift
//  Shop
//
//  Created by Sam Mazniker on 27/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//  Запросы к серверу на получение товаров

import Foundation
import Alamofire

final class ShopNetworkManager {
    func requestShopItems(page: Int? = 1, completionHandler: @escaping ([ShopItem]?) -> Void) {
        let parameters = ["page": page!,
                          "accessToken": Session.shared.accessToken()] as [String : Any]
        let request = AF.request("http://localhost:8080/shop/get_items", method: .post, parameters: parameters)
        let parser = ShopParser()
        parser.parseItems(from: request) { response in
            completionHandler(response)
        }
    }
    
    func requestCategories(completionHandler: @escaping ([Category]?) -> Void) {
        let parameters = ["accessToken": Session.shared.accessToken()]
        let request = AF.request("http://localhost:8080/shop/get_category", method: .post, parameters: parameters)
        let parser = ShopParser()
        parser.parseCategories(from: request) { response in
            completionHandler(response)
        }
    }
    
    func requestColors(completionHandler: @escaping ([Color]?) -> Void) {
        let parameters = ["accessToken": Session.shared.accessToken()]
        let request = AF.request("http://localhost:8080/shop/get_color", method: .post, parameters: parameters)
        let parser = ShopParser()
        parser.parseColors(from: request) { response in
            completionHandler(response)
        }
    }
    
    func requestSizes(completionHandler: @escaping ([Size]?) -> Void) {
        let parameters = ["accessToken": Session.shared.accessToken()]
        let request = AF.request("http://localhost:8080/shop/get_size", method: .post, parameters: parameters)
        let parser = ShopParser()
        parser.parseSizes(from: request) { response in
            completionHandler(response)
        }
    }
}
