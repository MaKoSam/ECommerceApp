//
//  LaunchHandler.swift
//  Shop
//
//  Created by Sam Mazniker on 23/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import Foundation

final class LaunchHandler {
    func prepareForLaunch(completionHandler: @escaping() -> Void){
        self.configureTranslations()
        self.configureUITheme()
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
