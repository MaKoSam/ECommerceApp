//
//  AuthControllerBuilder.swift
//  Shop
//
//  Created by Sam Mazniker on 19/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class AuthControllerBuilder: NSObject {
    let theme = Session.shared.theme
    
    func buildDefaultController() -> AuthViewController{
        var controller = AuthViewController()
        controller = self.setUpViews(for: controller)
        controller.constraints = self.setUpConstraints(for: controller)
        return controller
    }
    
    private func setUpViews(for controller: AuthViewController) -> AuthViewController{
        controller.view.backgroundColor = theme.backgroundColor
        
        controller.headline.text = Session.shared.translations["signIn"]
        controller.headline.adjustsFontSizeToFitWidth = true
        controller.headline.textAlignment = .left
        controller.headline.textColor = theme.textColorWhite
        controller.headline.font = theme.fontBig
        controller.headline.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.headline)
        
        controller.usernameView.backgroundColor = theme.secondBackgroundColor
        controller.usernameView.layer.cornerRadius = theme.viewCornerRadius
        controller.usernameView.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.usernameView)
        
        controller.passwordView.backgroundColor = theme.secondBackgroundColor
        controller.passwordView.layer.cornerRadius = theme.viewCornerRadius
        controller.passwordView.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.passwordView)
        
        controller.usernameLabel.text = Session.shared.translations["name"]
        controller.usernameLabel.textAlignment = .left
        controller.usernameLabel.textColor = theme.secondTextColor
        controller.usernameLabel.font = theme.fontSmall
        controller.usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.usernameLabel)
        
        controller.passwordLabel.text = Session.shared.translations["password"]
        controller.passwordLabel.textAlignment = .left
        controller.passwordLabel.textColor = theme.secondTextColor
        controller.passwordLabel.font = theme.fontSmall
        controller.passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.passwordLabel)
        
        controller.usernameField.text = "..."
        controller.usernameField.textColor = theme.textColorWhite
        controller.usernameField.font = theme.fontMedium
        controller.usernameField.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.usernameField)
        
        controller.passwordField.text = "..."
        controller.passwordField.textColor = theme.textColorWhite
        controller.passwordField.font = theme.fontMedium
        controller.passwordField.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.passwordField)
        
        controller.signInButton.setTitle(Session.shared.translations["signInBut"], for: .normal)
        controller.signInButton.setTitleColor(theme.textColorWhite, for: .normal)
        controller.signInButton.backgroundColor = theme.buttonColor
        controller.signInButton.translatesAutoresizingMaskIntoConstraints = false
        controller.signInButton.layer.cornerRadius = theme.buttonCornerRadius
        controller.view.addSubview(controller.signInButton)
        
        return controller
    }
    
    private func setUpConstraints(for controller: AuthViewController) -> [NSLayoutConstraint] {
        return [
            controller.headline.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 100.0),
            controller.headline.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 14.0),
            controller.headline.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -14.0),
            controller.headline.heightAnchor.constraint(equalToConstant: 34.0),
            
            controller.usernameView.topAnchor.constraint(equalTo: controller.headline.bottomAnchor, constant: 73.0),
            controller.usernameView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 16.0),
            controller.usernameView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -16.0),
            controller.usernameView.heightAnchor.constraint(equalToConstant: 64.0),
            
            controller.passwordView.topAnchor.constraint(equalTo: controller.usernameView.bottomAnchor, constant: 8.0),
            controller.passwordView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 16.0),
            controller.passwordView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -16.0),
            controller.passwordView.heightAnchor.constraint(equalToConstant: 64.0),
            
            controller.usernameLabel.topAnchor.constraint(equalTo: controller.usernameView.topAnchor, constant: 14.0),
            controller.usernameLabel.leadingAnchor.constraint(equalTo: controller.usernameView.leadingAnchor, constant: 20.0),
            controller.usernameLabel.trailingAnchor.constraint(equalTo: controller.usernameView.trailingAnchor, constant: -20.0),
            controller.usernameLabel.heightAnchor.constraint(equalToConstant: 14.0),
            
            controller.passwordLabel.topAnchor.constraint(equalTo: controller.passwordView.topAnchor, constant: 14.0),
            controller.passwordLabel.leadingAnchor.constraint(equalTo: controller.passwordView.leadingAnchor, constant: 20.0),
            controller.passwordLabel.trailingAnchor.constraint(equalTo: controller.passwordView.trailingAnchor, constant: -20.0),
            controller.passwordLabel.heightAnchor.constraint(equalToConstant: 14.0),
            
            controller.usernameField.topAnchor.constraint(equalTo: controller.usernameLabel.bottomAnchor, constant: 5.0),
            controller.usernameField.leadingAnchor.constraint(equalTo: controller.usernameView.leadingAnchor, constant: 20.0),
            controller.usernameField.trailingAnchor.constraint(equalTo: controller.usernameView.trailingAnchor, constant: -20.0),
            controller.usernameField.heightAnchor.constraint(equalToConstant: 25.0),
            
            controller.passwordField.topAnchor.constraint(equalTo: controller.passwordLabel.bottomAnchor, constant: 5.0),
            controller.passwordField.leadingAnchor.constraint(equalTo: controller.passwordView.leadingAnchor, constant: 20.0),
            controller.passwordField.trailingAnchor.constraint(equalTo: controller.passwordView.trailingAnchor, constant: -20.0),
            controller.passwordField.heightAnchor.constraint(equalToConstant: 25.0),
            
            controller.signInButton.topAnchor.constraint(equalTo: controller.passwordView.bottomAnchor, constant: 64.0),
            controller.signInButton.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 16.0),
            controller.signInButton.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -16.0),
            controller.signInButton.heightAnchor.constraint(equalToConstant: 48.0)
        ]
    }
    
}
