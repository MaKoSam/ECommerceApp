//
//  AppDelegate.swift
//  Shop
//
//  Created by Sam Mazniker on 18/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = RootViewController()
        window?.makeKeyAndVisible()
        return true
    }

}


//Get RootViewController from any place
extension AppDelegate{
    static var shared: AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
    var rootViewController: RootViewController{
        return window!.rootViewController as! RootViewController
    }
}

