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
    var headlineLabed = UILabel()
    
    var playerView = PlayerView()
    var videoPlayer: VideoPlayer?
    
    var constraints = [NSLayoutConstraint]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NSLayoutConstraint.activate(constraints)
        self.playerView.player?.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let timeStart = DispatchTime.now()
        let launcher = LaunchHandler()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            UIView.animate(withDuration: 3.0){
                self.headlineLabed.alpha = 1.0
                self.activityIndicator.alpha = 1.0
            }
        }
        
        if Session.shared.needAuth() {
            launcher.launch(withUser: false) { isSuccess in
                self.activityIndicator.stopAnimating()
                if DispatchTime.now() - .seconds(15) > timeStart {
                    print("REQUEST TIME OUT")
                } else {
                    DispatchQueue.main.asyncAfter(deadline: timeStart + .seconds(6)){
                        AppDelegate.shared.rootViewController.showLoginBranch()
                    }
                }
            }
        } else {
            launcher.launch(withUser: true) { isSuccess in
                self.activityIndicator.stopAnimating()
                if DispatchTime.now() - .seconds(15) > timeStart {
                    print("REQUEST TIME OUT")
                } else {
                    if isSuccess {
                        DispatchQueue.main.asyncAfter(deadline: timeStart + .seconds(6)){
                            AppDelegate.shared.rootViewController.showMainBranch()
                        }
                    } else {
                        DispatchQueue.main.asyncAfter(deadline: timeStart + .seconds(6)){
                            AppDelegate.shared.rootViewController.showLoginBranch()
                        }
                    }
                }
            }
        }
    }
}
