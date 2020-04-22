//
//  Russian.swift
//  Shop
//
//  Created by Sam Mazniker on 22/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class Russian {
    static let shared = Russian()
    private var dictionary = [String: String]()
    
    func getTranslations() -> [String: String]{
        return dictionary
    }
    
    private init(){
        //Register & Login & User
        dictionary.updateValue("Зарегистрируйтесь", forKey: "signUpLabel")
        dictionary.updateValue("Войдите в свой аккаунт", forKey: "signInLabel")
        dictionary.updateValue("Зарегистрироваться", forKey: "signUpBut")
        dictionary.updateValue("Войти", forKey: "signInBut")
        
        dictionary.updateValue("У вас нет аккаунта?", forKey: "transferToSignUp")
        dictionary.updateValue("Зарегистрируйтесь!", forKey: "transferToSignUpBut")
        dictionary.updateValue("Уже есть аккаунт?", forKey: "transferToSignIn")
        dictionary.updateValue("Войти.", forKey: "transferToSignInBut")
        
        dictionary.updateValue("Ваше имя", forKey: "name")
        dictionary.updateValue("Ваша почта", forKey: "email")
        dictionary.updateValue("Пароль", forKey: "password")
        dictionary.updateValue("Пароль еще раз", forKey: "passwordRep")
        
        //User address
        dictionary.updateValue("Адрес доставки", forKey: "address")
        dictionary.updateValue("Страна", forKey: "country")
        dictionary.updateValue("Город", forKey: "city")
        dictionary.updateValue("Улица", forKey: "line1")
        dictionary.updateValue("Дополнительно", forKey: "line2")
        dictionary.updateValue("Дом", forKey: "house")
        dictionary.updateValue("Квартира", forKey: "apartment")
        
        //Function buttons
        dictionary.updateValue("Обновить", forKey: "update")
        dictionary.updateValue("В корзину", forKey: "buy")
    }
}
