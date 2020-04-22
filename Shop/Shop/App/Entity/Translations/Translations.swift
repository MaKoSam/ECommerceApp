//
//  Translations.swift
//  Shop
//
//  Created by Sam Mazniker on 21/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class Translations: NSObject {
    func requestDictionary(for language: String) -> [String: String]{
        switch language {
        case "ru-RU":
            return Russian.shared.getTranslations()
        default:
            return English.shared.getTranslations()
        }
    }
    
    func getDefaultDictionary() -> [String: String]{
        let systemLang = Locale.preferredLanguages[0]
        print(systemLang)
        switch systemLang {
        case "ru":
            return Russian.shared.getTranslations()
        case "ru-ru":
            return Russian.shared.getTranslations()
        case "ru-RU":
            return Russian.shared.getTranslations()
        default:
            return English.shared.getTranslations()
        }
    }
    
}
