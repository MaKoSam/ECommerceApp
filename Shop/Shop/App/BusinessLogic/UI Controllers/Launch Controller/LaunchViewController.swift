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
        completeLaunchProcedures()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            UIView.animate(withDuration: 3.0){
                self.headlineLabed.alpha = 1.0
                self.activityIndicator.alpha = 1.0
            }
        }
    }
    
    private func completeLaunchProcedures() {
        let launchBeginTime = DispatchTime.now()
        let launcher = LaunchHandler()
        launcher.launch {
            if Session.shared.needAuth() {
                DispatchQueue.main.asyncAfter(deadline: launchBeginTime + .seconds(6)){
                    self.activityIndicator.stopAnimating()
                    AppDelegate.shared.rootViewController.showLoginBranch()
                }
            } else {
                launcher.refreshUser() { isSuccess in
                    if isSuccess {
                        launcher.configureShop(){
                            DispatchQueue.main.asyncAfter(deadline: launchBeginTime + .seconds(6)){
                                self.activityIndicator.stopAnimating()
                                AppDelegate.shared.rootViewController.showMainBranch()
                            }
                        }
                    } else {
                        DispatchQueue.main.asyncAfter(deadline: launchBeginTime + .seconds(6)){
                            self.activityIndicator.stopAnimating()
                            AppDelegate.shared.rootViewController.showLoginBranch()
                        }
                    }
                }
            }
        }
    }
}
