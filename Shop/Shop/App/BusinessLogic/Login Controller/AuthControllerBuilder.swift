//
//  AuthControllerBuilder.swift
//  Shop
//
//  Created by Sam Mazniker on 19/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class AuthControllerBuilder: NSObject {
    func buildDefaultController() -> AuthViewController{
        var controller = AuthViewController()
        controller = self.setUpViews(for: controller)
        controller.constraints = self.setUpConstraints(for: controller)
        return controller
    }
    
    private func setUpViews(for controller: AuthViewController) -> AuthViewController{
        controller.view.backgroundColor = UIColor.white
        
        controller.emailLabel.text = "Login:"
        controller.emailLabel.textAlignment = .center
        controller.emailLabel.textColor = UIColor.black
        controller.emailLabel.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.emailLabel)
        
        controller.passwordLabel.text = "Password:"
        controller.passwordLabel.textAlignment = .center
        controller.passwordLabel.textColor = UIColor.black
        controller.passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.passwordLabel)
        
        controller.emailField.text = "enter your email..."
        controller.emailField.keyboardType = .emailAddress
        controller.emailField.textContentType = .emailAddress
        controller.emailField.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.emailField)
        
        controller.passwordField.text = "enter your password..."
        controller.passwordField.textContentType = .password
        controller.passwordField.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.passwordField)
        
        controller.signInButton.setTitle("Login", for: .normal)
        controller.signInButton.backgroundColor = UIColor.black
        controller.signInButton.setTitleColor(UIColor.white, for: .normal)
        controller.signInButton.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.signInButton)
        
        return controller
    }
    
    private func setUpConstraints(for controller: AuthViewController) -> [NSLayoutConstraint] {
        return [
            controller.emailLabel.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 50.0),
            controller.emailLabel.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 30.0),
            controller.emailLabel.widthAnchor.constraint(equalToConstant: 50.0),
            controller.emailLabel.heightAnchor.constraint(equalToConstant: 50.0),
            
            controller.emailField.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 50.0),
            controller.emailField.leadingAnchor.constraint(equalTo: controller.emailLabel.trailingAnchor, constant: 20.0),
            controller.emailField.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -30.0),
            controller.emailField.heightAnchor.constraint(equalToConstant: 50.0),
            
            controller.passwordLabel.topAnchor.constraint(equalTo: controller.emailLabel.bottomAnchor, constant: 50.0),
            controller.passwordLabel.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 30.0),
            controller.passwordLabel.widthAnchor.constraint(equalToConstant: 50.0),
            controller.passwordLabel.heightAnchor.constraint(equalToConstant: 50.0),
            
            controller.passwordField.topAnchor.constraint(equalTo: controller.emailField.bottomAnchor, constant: 50.0),
            controller.passwordField.leadingAnchor.constraint(equalTo: controller.passwordLabel.trailingAnchor, constant: 20.0),
            controller.passwordField.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -30.0),
            controller.passwordField.heightAnchor.constraint(equalToConstant: 50.0),
            
            controller.signInButton.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 30.0),
            controller.signInButton.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -30.0),
            controller.signInButton.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor, constant: -50.0),
            controller.signInButton.heightAnchor.constraint(equalToConstant: 50.0)
        ]
    }

}
