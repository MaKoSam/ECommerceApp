//
//  LaunchHandler.swift
//  Shop
//
//  Created by Sam Mazniker on 23/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class LaunchHandler {
    
    func prepareForLaunch(completionHandler: @escaping() -> Void){
        
        completionHandler()
    }
    
    private func configureTranslations() {
        let requestTranslations = Translations()
        Session.shared.translations = requestTranslations.getDefaultDictionary()
    }

}
