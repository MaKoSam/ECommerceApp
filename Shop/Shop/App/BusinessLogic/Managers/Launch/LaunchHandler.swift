//
//  LaunchHandler.swift
//  Shop
//
//  Created by Sam Mazniker on 23/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class LaunchHandler {
    
    func launch(withUser user: Bool,completionHandler: @escaping(Bool) -> Void) {
        self.configureTranslations()
        self.configureUITheme()
        
        if user {
            self.refreshUserToken { isSuccess in
                if isSuccess {
                    self.getItems {
                        completionHandler(true)
                        return
                    }
                }
                completionHandler(false)
                return
            }
        }
        
        completionHandler(true)
    }
    
    private func refreshUserToken(completionHandler: @escaping(Bool) -> Void) {
        let authNetworkManager = AuthNetworkManager()
        authNetworkManager.refreshToken(with: Session.shared.refreshToken()){ updatedUser in
            guard let user = updatedUser else {
                completionHandler(false)
                return
            }
            Session.shared.setUser(user)
            completionHandler(true)
            
            DispatchQueue.global(qos: .background).async {
                let userManager = UserManager()
                userManager.saveUser(user: user)
            }
        }
    }
    
    private func getItems(completionHandler: @escaping() -> Void) {
        ShopItemManager.shared.requestShopItems(page: 1){
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
