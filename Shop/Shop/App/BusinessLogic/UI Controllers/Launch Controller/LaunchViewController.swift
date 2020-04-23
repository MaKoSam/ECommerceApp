//
//  LaunchViewController.swift
//  Shop
//
//  Created by Sam Mazniker on 23/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//
// Контроллер запускает класс для выполнения
// всех конфигураций и запросов перед началом работы приложения.

import UIKit

class LaunchViewController: UIViewController {
    var activityIndicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        let launcher = LaunchHandler()
        
        launcher.prepareForLaunch(){
            DispatchQueue.main.async{
                
                self.activityIndicator.stopAnimating()
                if Session.shared.isLoggedIn() {
                    AppDelegate.shared.rootViewController.showMainBranch()
                } else {
                    AppDelegate.shared.rootViewController.showLoginBranch()
                }
                
            }
        }
    }
}
