//
//  RegisterControllerBuilder.swift
//  Shop
//
//  Created by Sam Mazniker on 20/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

final class RegisterControllerBuilder {
    let theme = Session.shared.theme
    
    func buildDefaultController() -> RegisterViewController{
           var controller = RegisterViewController()
           controller = self.setUpViews(for: controller)
           controller.constraints = self.setUpConstraints(for: controller)
           return controller
       }
       
    private func setUpViews(for controller: RegisterViewController) -> RegisterViewController{
        controller.view.backgroundColor = theme.backgroundColor
        
        controller.headline.text = Session.shared.translations["signUp"]
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
    
        controller.emailView.backgroundColor = theme.secondBackgroundColor
        controller.emailView.layer.cornerRadius = theme.viewCornerRadius
        controller.emailView.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.emailView)
        
        controller.passwordView.backgroundColor = theme.secondBackgroundColor
        controller.passwordView.layer.cornerRadius = theme.viewCornerRadius
        controller.passwordView.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.passwordView)
        
        controller.passwordRepeatView.backgroundColor = theme.secondBackgroundColor
        controller.passwordRepeatView.layer.cornerRadius = theme.viewCornerRadius
        controller.passwordRepeatView.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.passwordRepeatView)
        
        controller.usernameLabel.text = Session.shared.translations["name"]
        controller.usernameLabel.textAlignment = .left
        controller.usernameLabel.textColor = theme.secondTextColor
        controller.usernameLabel.font = theme.fontSmall
        controller.usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.usernameLabel)
        
        controller.emailLabel.text = Session.shared.translations["email"]
        controller.emailLabel.textAlignment = .left
        controller.emailLabel.textColor = theme.secondTextColor
        controller.emailLabel.font = theme.fontSmall
        controller.emailLabel.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.emailLabel)
        
        controller.passwordLabel.text = Session.shared.translations["password"]
        controller.passwordLabel.textAlignment = .left
        controller.passwordLabel.textColor = theme.secondTextColor
        controller.passwordLabel.font = theme.fontSmall
        controller.passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.passwordLabel)
        
        controller.passwordRepeatLabel.text = Session.shared.translations["passwordRepeat"]
        controller.passwordRepeatLabel.textAlignment = .left
        controller.passwordRepeatLabel.textColor = theme.secondTextColor
        controller.passwordRepeatLabel.font = theme.fontSmall
        controller.passwordRepeatLabel.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.passwordRepeatLabel)
        
        controller.transferToLoginLabel.text = Session.shared.translations["transferToSignIn"]
        controller.transferToLoginLabel.textAlignment = .right
        controller.transferToLoginLabel.textColor = theme.textColorWhite
        controller.transferToLoginLabel.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.transferToLoginLabel)
        
        controller.usernameField.text = "..."
        controller.usernameField.textColor = theme.textColorWhite
        controller.usernameField.font = theme.fontMedium
        controller.usernameField.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.usernameField)
        
        controller.emailField.text = "..."
        controller.emailField.textColor = theme.textColorWhite
        controller.emailField.font = theme.fontMedium
        controller.emailField.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.emailField)
        
        controller.passwordField.text = "..."
        controller.passwordField.textColor = theme.textColorWhite
        controller.passwordField.font = theme.fontMedium
        controller.passwordField.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.passwordField)
        
        controller.passwordRepeatField.text = "..."
        controller.passwordRepeatField.textColor = theme.textColorWhite
        controller.passwordRepeatField.font = theme.fontMedium
        controller.passwordRepeatField.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.passwordRepeatField)
        
        controller.registerButton.setTitle(Session.shared.translations["signUpBut"], for: .normal)
        controller.registerButton.setTitleColor(theme.textColorWhite, for: .normal)
        controller.registerButton.backgroundColor = theme.buttonColor
        controller.registerButton.translatesAutoresizingMaskIntoConstraints = false
        controller.registerButton.layer.cornerRadius = theme.buttonCornerRadius
        controller.view.addSubview(controller.registerButton)
        
        controller.transferToLoginButton.setTitle(Session.shared.translations["transferToSignInBut"], for: .normal)
        controller.transferToLoginButton.setTitleColor(theme.buttonColor, for: .normal)
        controller.transferToLoginButton.titleLabel?.textAlignment = .left
        controller.transferToLoginButton.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.transferToLoginButton)
        
        return controller
    }
       
    private func setUpConstraints(for controller: RegisterViewController) -> [NSLayoutConstraint] {
        return [
            controller.headline.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 100.0),
            controller.headline.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 14.0),
            controller.headline.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -14.0),
            controller.headline.heightAnchor.constraint(equalToConstant: 34.0),
            
            controller.usernameView.topAnchor.constraint(equalTo: controller.headline.bottomAnchor, constant: 73.0),
            controller.usernameView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 16.0),
            controller.usernameView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -16.0),
            controller.usernameView.heightAnchor.constraint(equalToConstant: 64.0),
            
            controller.emailView.topAnchor.constraint(equalTo: controller.usernameView.bottomAnchor, constant: 8.0),
            controller.emailView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 16.0),
            controller.emailView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -16.0),
            controller.emailView.heightAnchor.constraint(equalToConstant: 64.0),
            
            controller.passwordView.topAnchor.constraint(equalTo: controller.emailView.bottomAnchor, constant: 8.0),
            controller.passwordView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 16.0),
            controller.passwordView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -16.0),
            controller.passwordView.heightAnchor.constraint(equalToConstant: 64.0),
            
            controller.passwordRepeatView.topAnchor.constraint(equalTo: controller.passwordView.bottomAnchor, constant: 8.0),
            controller.passwordRepeatView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 16.0),
            controller.passwordRepeatView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -16.0),
            controller.passwordRepeatView.heightAnchor.constraint(equalToConstant: 64.0),
            
            controller.usernameLabel.topAnchor.constraint(equalTo: controller.usernameView.topAnchor, constant: 14.0),
            controller.usernameLabel.leadingAnchor.constraint(equalTo: controller.usernameView.leadingAnchor, constant: 20.0),
            controller.usernameLabel.trailingAnchor.constraint(equalTo: controller.usernameView.trailingAnchor, constant: -20.0),
            controller.usernameLabel.heightAnchor.constraint(equalToConstant: 14.0),
            
            controller.emailLabel.topAnchor.constraint(equalTo: controller.emailView.topAnchor, constant: 14.0),
            controller.emailLabel.leadingAnchor.constraint(equalTo: controller.emailView.leadingAnchor, constant: 20.0),
            controller.emailLabel.trailingAnchor.constraint(equalTo: controller.emailView.trailingAnchor, constant: -20.0),
            controller.emailLabel.heightAnchor.constraint(equalToConstant: 14.0),
            
            controller.passwordLabel.topAnchor.constraint(equalTo: controller.passwordView.topAnchor, constant: 14.0),
            controller.passwordLabel.leadingAnchor.constraint(equalTo: controller.passwordView.leadingAnchor, constant: 20.0),
            controller.passwordLabel.trailingAnchor.constraint(equalTo: controller.passwordView.trailingAnchor, constant: -20.0),
            controller.passwordLabel.heightAnchor.constraint(equalToConstant: 14.0),
            
            controller.passwordRepeatLabel.topAnchor.constraint(equalTo: controller.passwordRepeatView.topAnchor, constant: 14.0),
            controller.passwordRepeatLabel.leadingAnchor.constraint(equalTo: controller.passwordRepeatView.leadingAnchor, constant: 20.0),
            controller.passwordRepeatLabel.trailingAnchor.constraint(equalTo: controller.passwordRepeatView.trailingAnchor, constant: -20.0),
            controller.passwordRepeatLabel.heightAnchor.constraint(equalToConstant: 14.0),
            
            controller.usernameField.topAnchor.constraint(equalTo: controller.usernameLabel.bottomAnchor, constant: 5.0),
            controller.usernameField.leadingAnchor.constraint(equalTo: controller.usernameView.leadingAnchor, constant: 20.0),
            controller.usernameField.trailingAnchor.constraint(equalTo: controller.usernameView.trailingAnchor, constant: -20.0),
            controller.usernameField.heightAnchor.constraint(equalToConstant: 25.0),
               
            controller.emailField.topAnchor.constraint(equalTo: controller.emailLabel.bottomAnchor, constant: 5.0),
            controller.emailField.leadingAnchor.constraint(equalTo: controller.emailView.leadingAnchor, constant: 20.0),
            controller.emailField.trailingAnchor.constraint(equalTo: controller.emailView.trailingAnchor, constant: -20.0),
            controller.emailField.heightAnchor.constraint(equalToConstant: 25.0),
               
            controller.passwordField.topAnchor.constraint(equalTo: controller.passwordLabel.bottomAnchor, constant: 5.0),
            controller.passwordField.leadingAnchor.constraint(equalTo: controller.passwordView.leadingAnchor, constant: 20.0),
            controller.passwordField.trailingAnchor.constraint(equalTo: controller.passwordView.trailingAnchor, constant: -20.0),
            controller.passwordField.heightAnchor.constraint(equalToConstant: 25.0),
            
            controller.passwordRepeatField.topAnchor.constraint(equalTo: controller.passwordRepeatLabel.bottomAnchor, constant: 5.0),
            controller.passwordRepeatField.leadingAnchor.constraint(equalTo: controller.passwordRepeatView.leadingAnchor, constant: 20.0),
            controller.passwordRepeatField.trailingAnchor.constraint(equalTo: controller.passwordRepeatView.trailingAnchor, constant: -20.0),
            controller.passwordRepeatField.heightAnchor.constraint(equalToConstant: 25.0),
            
            controller.transferToLoginButton.topAnchor.constraint(equalTo: controller.passwordRepeatView.bottomAnchor, constant: 30.0),
            controller.transferToLoginButton.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -16.0),
            controller.transferToLoginButton.widthAnchor.constraint(equalToConstant: 64.0),
            controller.transferToLoginButton.heightAnchor.constraint(equalToConstant: 20.0),
            
            controller.transferToLoginLabel.topAnchor.constraint(equalTo: controller.passwordRepeatView.bottomAnchor, constant: 30.0),
            controller.transferToLoginLabel.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 30.0),
            controller.transferToLoginLabel.trailingAnchor.constraint(equalTo: controller.transferToLoginButton.leadingAnchor, constant: -10.0),
            controller.transferToLoginLabel.heightAnchor.constraint(equalToConstant: 20.0),
               
            controller.registerButton.topAnchor.constraint(equalTo: controller.passwordRepeatView.bottomAnchor, constant: 64.0),
            controller.registerButton.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 16.0),
            controller.registerButton.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -16.0),
            controller.registerButton.heightAnchor.constraint(equalToConstant: 48.0)
        ]
    }
}
