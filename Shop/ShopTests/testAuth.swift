//
//  testAuth.swift
//  ShopTests
//
//  Created by Sam Mazniker on 22/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import XCTest
@testable import Shop

class testAuth: XCTestCase {
    var auth = Authorizator()

    func testAuthSuccess() throws{
        //when
        let username = "smazemen@gmail.com"
        let password = "PassWord1"
        //then -> Error == nil
        
        //test
        auth.signIn(with: username, password: password){ error in
            if error != nil {
                XCTFail()
            }
        }
    }
    
    func testAuthFail() throws{
        //when
        let username = "nonexisting@mail.com"
        let password = "SomePassword"
        
        //then -> Error: No such user
        auth.signIn(with: username, password: password) { error in
            if error == nil {
                XCTFail()
            }
        }
    }
    
    func testAuthFormattingMail() throws {
        //when
        let username = "badformat"
        let password = "someformat"
        
        //then -> Error: Email bad formatted
        
        //test
        auth.signIn(with: username, password: password){ error in
            if error == nil{
                XCTFail()
            }
        }
    }
}
