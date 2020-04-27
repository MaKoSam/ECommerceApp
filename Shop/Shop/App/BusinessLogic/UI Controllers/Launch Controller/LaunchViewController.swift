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
        self.view.backgroundColor = UIColor.red
        let launcher = LaunchHandler()
        
        if Session.shared.needAuth() {
            AppDelegate.shared.rootViewController.showLoginBranch()
        } else {
            launcher.prepareForLaunch(){
                DispatchQueue.main.async{
                    self.activityIndicator.stopAnimating()
                    AppDelegate.shared.rootViewController.showMainBranch()
                }
            }
        }
        
    }
}
