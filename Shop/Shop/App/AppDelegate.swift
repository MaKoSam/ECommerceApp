//
//  AppDelegate.swift
//  Shop
//
//  Created by Sam Mazniker on 18/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        FirebaseApp.configure()
        let requestTranslations = Translations()
        Session.shared.translations = requestTranslations.getDefaultDictionary()
        
        var navigationController = UINavigationController()
        var newController = RootViewController()
        navigationController.pushViewController(newController, animated: true)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

}


//So we can get RootViewController from any place
extension AppDelegate{
    static var shared: AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
    var rootViewController: RootViewController{
        return window!.rootViewController as! RootViewController
    }
}

