//
//  English.swift
//  Shop
//
//  Created by Sam Mazniker on 22/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class English {
    static let shared = English()
    private var dictionary = [String: String]()
    
    func getTranslations() -> [String: String]{
        return dictionary
    }
    
    private init() {
        //Register & Login & User
        dictionary.updateValue("Register", forKey: "signUp")
        dictionary.updateValue("Sign in", forKey: "signIn")
        dictionary.updateValue("Sign Up", forKey: "signUpBut")
        dictionary.updateValue("Log In", forKey: "signInBut")
        
        dictionary.updateValue("Don't have an account?", forKey: "transferToSignUp")
        dictionary.updateValue("Sign Up.", forKey: "transferToSignUpBut")
        dictionary.updateValue("Already have account?", forKey: "transferToSignIn")
        dictionary.updateValue("Sign In.", forKey: "transferToSignInBut")
        
        dictionary.updateValue("Name", forKey: "name")
        dictionary.updateValue("Email", forKey: "email")
        dictionary.updateValue("Password", forKey: "password")
        dictionary.updateValue("Password Again", forKey: "passwordRepeat")
        
        //User address
        dictionary.updateValue("Delivery Address", forKey: "address")
        dictionary.updateValue("Country", forKey: "country")
        dictionary.updateValue("City", forKey: "city")
        dictionary.updateValue("Line one", forKey: "line1")
        dictionary.updateValue("Line two", forKey: "line2")
        dictionary.updateValue("House", forKey: "house")
        dictionary.updateValue("Apartment", forKey: "apartment")
        
        //Function buttons
        dictionary.updateValue("Update", forKey: "update")
        dictionary.updateValue("Add to cart", forKey: "buy")
        
        //Shop
        dictionary.updateValue("Products", forKey: "shop")
        dictionary.updateValue("Search", forKey: "search")
        dictionary.updateValue("Shopping cart", forKey: "shopcart")
    }
}
