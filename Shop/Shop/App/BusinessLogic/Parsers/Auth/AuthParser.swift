//
//  AuthSignInRequestParser.swift
//  Shop
//
//  Created by Sam Mazniker on 30/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation
import Alamofire

final class AuthResponseParser {
    func parseResponse(from request: DataRequest, completionHandler: @escaping (User?) -> Void) {
        request.responseDecodable(of: UserResponse.self){ result in
            if result.error == nil {
                let builder = UserBuilder()
                completionHandler(builder.buildUser(from: result.value))
                return
            }
            completionHandler(nil)
        }
    }
}
