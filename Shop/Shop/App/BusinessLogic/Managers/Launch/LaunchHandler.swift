//
//  LaunchHandler.swift
//  Shop
//
//  Created by Sam Mazniker on 23/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//
//  configure session

import Foundation

final class LaunchHandler {
    func launch(completionHandler: @escaping() -> Void) {
        self.configureTranslations()
        self.configureUITheme()
        completionHandler()
    }
    
    func refreshUser(completionHandler: @escaping (Bool) -> Void) {
        let authorizator = Authorizator()
        authorizator.refreshToken(with: Session.shared.refreshToken()){ user in
            guard let user = user else {
                completionHandler(false)
                return
            }
            Session.shared.setUser(user)
            DispatchQueue.global(qos: .background).async {
                let userManager = UserManager()
                userManager.saveUser(user: user)
            }
            completionHandler(true)
        }
    }
 
    
    func configureShop(completionHandler: @escaping() -> Void) {
        Session.shared.shopManager.configureShop {
            completionHandler()
        }
    }
    
    private func configureUITheme() {
        let themeManager = ThemeManager()
        let theme = themeManager.getDefaultTheme()
        Session.shared.theme = theme
    }
    
    private func configureTranslations() {
        let requestTranslations = Translations()
        let language = Locale.preferredLanguages[0]
        Session.shared.translations = requestTranslations.requestDictionary(for: language)
    }
}
