//
//  testReg.swift
//  ShopTests
//
//  Created by Sam Mazniker on 22/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import XCTest
@testable import Shop

class testReg: XCTestCase {
    let reg = Registrator()
    
    func testRegSuccess() throws{
        //when
        let username = "smazemen@qq.com"
        let password = "PassWord1"
        //then -> Error == nil
        
        //test
        reg.signUp(with: username, and: password){ error in
            if error == nil {
                XCTFail()
            }
        }
    }
    
    func testRegFail() throws{
        //when
        let username = "smazemen@qq.com"
        let password = "SomePassword"
        
        //then -> Error: username taken
        reg.signUp(with: username, and: password){ error in
            if error == nil {
                XCTFail()
            }
        }
    }
    
    func testRegFormatting() throws {
        //when
        let username = "badformat"
        let password = "someformat"
        
        //then -> Error: Email bad formatted
        
        //test
        reg.signUp(with: username, and: password){ error in
            if error == nil{
                XCTFail()
            }
        }
    }
}
