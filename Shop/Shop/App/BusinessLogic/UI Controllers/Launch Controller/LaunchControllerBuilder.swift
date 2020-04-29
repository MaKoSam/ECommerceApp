//
//  ControllerBuilder.swift
//  Shop
//
//  Created by Sam Mazniker on 23/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class LaunchControllerBuilder: NSObject {
    let theme = Session.shared.theme
    
    func buildDefaultController() -> LaunchViewController{
        var controller = LaunchViewController()
        controller = configureViews(for: controller)
        controller = configureVideo(for: controller)
        controller.constraints = configureConstraints(for: controller)
        return controller
    }
    
    private func configureViews(for controller: LaunchViewController) -> LaunchViewController {
        controller.playerView.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.playerView)
        
        controller.headlineLabed.text = "Fashion Novation"
        controller.headlineLabed.font = UIFont(name: "Helvetica-Bold", size: 64.0)
        controller.headlineLabed.numberOfLines = 3
        controller.headlineLabed.lineBreakMode = .byWordWrapping
        controller.headlineLabed.textAlignment = .center
        controller.headlineLabed.textColor = theme.textColorWhite
        controller.headlineLabed.translatesAutoresizingMaskIntoConstraints = false
        controller.headlineLabed.alpha = 0.0
        controller.view.addSubview(controller.headlineLabed)
        
        controller.activityIndicator.startAnimating()
        controller.activityIndicator.style = .whiteLarge
        controller.activityIndicator.alpha = 0.0
        controller.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.activityIndicator)
        return controller
    }
    
    private func configureVideo(for controller: LaunchViewController) -> LaunchViewController {
        guard let path = Bundle.main.path(forResource: "LaunchVideo", ofType: "mp4") else {
            return controller
        }
        let videoURL = NSURL(fileURLWithPath: path)
        controller.videoPlayer = VideoPlayer(urlAsset: videoURL, view: controller.playerView)
        return controller
    }
    
    private func configureConstraints(for controller: LaunchViewController) -> [NSLayoutConstraint] {
        let constraints = [
            controller.headlineLabed.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 0.0),
            controller.headlineLabed.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: 0.0),
            controller.headlineLabed.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor, constant: -100.0),
            controller.headlineLabed.heightAnchor.constraint(equalToConstant: 200),
            
            controller.activityIndicator.topAnchor.constraint(equalTo: controller.headlineLabed.bottomAnchor, constant: 20.0),
            controller.activityIndicator.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor, constant: 0.0),
            
            controller.playerView.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 0),
            controller.playerView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 0),
            controller.playerView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: 0),
            controller.playerView.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor, constant: 0)]
        return constraints
    }
}
