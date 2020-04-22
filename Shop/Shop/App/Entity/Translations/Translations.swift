//
//  Translations.swift
//  Shop
//
//  Created by Sam Mazniker on 21/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class Translations: NSObject {
    private var russianTranslations = [String: String]()
    private var englishTranslations = [String: String]()
    
    func requestDictionary(for language: String) -> [String: String]{
        switch language {
        case "ru":
            return russianTranslations
        case "en":
            return englishTranslations
        default:
            return englishTranslations
        }
    }
    
    func getDefaultDictionary() -> [String: String]{
        let systemLang = Locale.preferredLanguages[0]
        print(systemLang)
        switch systemLang {
        case "ru":
            return russianTranslations
        case "ru-ru":
            return russianTranslations
        case "ru-RU":
            return russianTranslations
        default:
            return englishTranslations
        }
    }
    
    override init(){
        super.init()
        russianTranslations.updateValue("Зарегистрируйтесь", forKey: "signUpLabel")
        russianTranslations.updateValue("Войдите в свой аккаунт", forKey: "signInLabel")
        russianTranslations.updateValue("Зарегистрироваться", forKey: "signUpBut")
        russianTranslations.updateValue("Войти", forKey: "signInBut")
        
        russianTranslations.updateValue("У вас нет аккаунта?", forKey: "transferToSignUp")
        russianTranslations.updateValue("Зарегистрируйтесь!", forKey: "transferToSignUpBut")
        russianTranslations.updateValue("Уже есть аккаунт?", forKey: "transferToSignIn")
        russianTranslations.updateValue("Войти.", forKey: "transferToSignInBut")
        
        russianTranslations.updateValue("Ваше имя", forKey: "name")
        russianTranslations.updateValue("Ваша почта", forKey: "email")
        russianTranslations.updateValue("Пароль", forKey: "password")
        russianTranslations.updateValue("Пароль еще раз", forKey: "passwordRep")
        
        russianTranslations.updateValue("Адрес доставки", forKey: "address")
        russianTranslations.updateValue("Страна", forKey: "country")
        russianTranslations.updateValue("Город", forKey: "city")
        russianTranslations.updateValue("Улица", forKey: "line1")
        russianTranslations.updateValue("Дополнительно", forKey: "line2")
        russianTranslations.updateValue("Дом", forKey: "house")
        russianTranslations.updateValue("Квартира", forKey: "apartment")
        
        russianTranslations.updateValue("Обновить", forKey: "update")
        russianTranslations.updateValue("В корзину", forKey: "buy")
        
        
        englishTranslations.updateValue("Create your account", forKey: "signUpLabel")
        englishTranslations.updateValue("Log into your account", forKey: "signInLabel")
        englishTranslations.updateValue("Sign Up", forKey: "signUpBut")
        englishTranslations.updateValue("Log In", forKey: "signInBut")
        
        englishTranslations.updateValue("Don't have an account?", forKey: "transferToSignUp")
        englishTranslations.updateValue("Sign Up.", forKey: "transferToSignUpBut")
        englishTranslations.updateValue("Already have account?", forKey: "transferToSignIn")
        englishTranslations.updateValue("Sign In.", forKey: "transferToSignInBut")
        
        englishTranslations.updateValue("Your name", forKey: "name")
        englishTranslations.updateValue("Email", forKey: "email")
        englishTranslations.updateValue("Password", forKey: "password")
        englishTranslations.updateValue("Password again", forKey: "passwordRep")
        
        englishTranslations.updateValue("Delivery Address", forKey: "address")
        englishTranslations.updateValue("Country", forKey: "country")
        englishTranslations.updateValue("City", forKey: "city")
        englishTranslations.updateValue("Line one", forKey: "line1")
        englishTranslations.updateValue("Line two", forKey: "line2")
        englishTranslations.updateValue("House", forKey: "house")
        englishTranslations.updateValue("Apartment", forKey: "apartment")
        
        englishTranslations.updateValue("Update", forKey: "update")
        englishTranslations.updateValue("Add to cart", forKey: "buy")
    }
}
