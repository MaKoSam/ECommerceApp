//
//  RegisterControllerBuilder.swift
//  Shop
//
//  Created by Sam Mazniker on 20/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class RegisterControllerBuilder: NSObject {
    func buildDefaultController() -> RegisterViewController{
           var controller = RegisterViewController()
           controller = self.setUpViews(for: controller)
           controller.constraints = self.setUpConstraints(for: controller)
           return controller
       }
       
    private func setUpViews(for controller: RegisterViewController) -> RegisterViewController{
        controller.title = Session.shared.translations["signUpLabel"]
        controller.view.backgroundColor = UIColor.white
    
//        controller.nameLabel.text = "Name:"
//        controller.nameLabel.textAlignment = .center
//        controller.nameLabel.textColor = UIColor.black
//        controller.nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        controller.view.addSubview(controller.nameLabel)
//
//        controller.emailLabel.text = "Email:"
//        controller.emailLabel.textAlignment = .center
//        controller.emailLabel.textColor = UIColor.black
//        controller.emailLabel.translatesAutoresizingMaskIntoConstraints = false
//        controller.view.addSubview(controller.emailLabel)
//
//        controller.passwordLabel.text = "Password:"
//        controller.passwordLabel.textAlignment = .center
//        controller.passwordLabel.textColor = UIColor.black
//        controller.passwordLabel.translatesAutoresizingMaskIntoConstraints = false
//        controller.view.addSubview(controller.passwordLabel)
//
//        controller.passwordRepeatLabel.text = "Password Agian:"
//        controller.passwordRepeatLabel.textAlignment = .center
//        controller.passwordRepeatLabel.textColor = UIColor.black
//        controller.passwordRepeatLabel.translatesAutoresizingMaskIntoConstraints = false
//        controller.view.addSubview(controller.passwordRepeatLabel)
        
        controller.transferToLoginLabel.text = Session.shared.translations["transferToSignIn"]
        controller.transferToLoginLabel.textAlignment = .center
        controller.transferToLoginLabel.textColor = UIColor.black
        controller.transferToLoginLabel.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.transferToLoginLabel)
        
        controller.nameField.text = Session.shared.translations["name"]
        controller.nameField.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.nameField)
        
        controller.emailField.text = Session.shared.translations["email"]
        controller.emailField.keyboardType = .emailAddress
        controller.emailField.textContentType = .emailAddress
        controller.emailField.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.emailField)
        
        controller.passwordField.text = Session.shared.translations["password"]
        controller.passwordField.textContentType = .password
        controller.passwordField.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.passwordField)
        
        controller.passwordRepeatField.text = Session.shared.translations["passwordRep"]
        controller.passwordRepeatField.textContentType = .password
        controller.passwordRepeatField.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.passwordRepeatField)
        
        controller.registerButton.setTitle(Session.shared.translations["signUpBut"], for: .normal)
        controller.registerButton.setTitleColor(UIColor.white, for: .normal)
        controller.registerButton.backgroundColor = UIColor.black
        controller.registerButton.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.registerButton)
        
        controller.transferToLoginButton.setTitle(Session.shared.translations["transferToSignInBut"], for: .normal)
        controller.transferToLoginButton.setTitleColor(UIColor.white, for: .normal)
        controller.transferToLoginButton.backgroundColor = UIColor.black
        controller.transferToLoginButton.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.transferToLoginButton)
        
        return controller
    }
       
    private func setUpConstraints(for controller: RegisterViewController) -> [NSLayoutConstraint] {
        return [
//            controller.nameLabel.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 50.0),
//            controller.nameLabel.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 30.0),
//            controller.nameLabel.widthAnchor.constraint(equalToConstant: 50.0),
//            controller.nameLabel.heightAnchor.constraint(equalToConstant: 50.0),
               
            controller.nameField.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 50.0),
            controller.nameField.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 30.0),
            controller.nameField.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -30.0),
            controller.nameField.heightAnchor.constraint(equalToConstant: 50.0),
               
//            controller.emailLabel.topAnchor.constraint(equalTo: controller.nameLabel.bottomAnchor, constant: 50.0),
//            controller.emailLabel.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 30.0),
//            controller.emailLabel.widthAnchor.constraint(equalToConstant: 50.0),
//            controller.emailLabel.heightAnchor.constraint(equalToConstant: 50.0),
               
            controller.emailField.topAnchor.constraint(equalTo: controller.nameField.bottomAnchor, constant: 50.0),
            controller.emailField.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 30.0),
            controller.emailField.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -30.0),
            controller.emailField.heightAnchor.constraint(equalToConstant: 50.0),
               
//            controller.passwordLabel.topAnchor.constraint(equalTo: controller.emailLabel.bottomAnchor, constant: 50.0),
//            controller.passwordLabel.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 30.0),
//            controller.passwordLabel.widthAnchor.constraint(equalToConstant: 50.0),
//            controller.passwordLabel.heightAnchor.constraint(equalToConstant: 50.0),
               
            controller.passwordField.topAnchor.constraint(equalTo: controller.emailField.bottomAnchor, constant: 50.0),
            controller.passwordField.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 20.0),
            controller.passwordField.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -30.0),
            controller.passwordField.heightAnchor.constraint(equalToConstant: 50.0),
            
//            controller.passwordRepeatLabel.topAnchor.constraint(equalTo: controller.passwordLabel.bottomAnchor, constant: 50.0),
//            controller.passwordRepeatLabel.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 30.0),
//            controller.passwordRepeatLabel.widthAnchor.constraint(equalToConstant: 50.0),
//            controller.passwordRepeatLabel.heightAnchor.constraint(equalToConstant: 50.0),
            
            controller.passwordRepeatField.topAnchor.constraint(equalTo: controller.passwordField.bottomAnchor, constant: 50.0),
            controller.passwordRepeatField.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 20.0),
            controller.passwordRepeatField.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -30.0),
            controller.passwordRepeatField.heightAnchor.constraint(equalToConstant: 50.0),
               
            controller.registerButton.topAnchor.constraint(equalTo: controller.passwordRepeatField.bottomAnchor, constant: 50.0),
            controller.registerButton.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 30.0),
            controller.registerButton.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -30.0),
            controller.registerButton.heightAnchor.constraint(equalToConstant: 50.0),
            
            controller.transferToLoginLabel.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 30.0),
            controller.transferToLoginLabel.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor, constant: -20.0),
            controller.transferToLoginLabel.heightAnchor.constraint(equalToConstant: 50.0),
            controller.transferToLoginLabel.widthAnchor.constraint(equalToConstant: 200.0),
            
            controller.transferToLoginButton.leadingAnchor.constraint(equalTo: controller.transferToLoginLabel.trailingAnchor, constant: 10.0),
            controller.transferToLoginButton.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -30.0),
            controller.transferToLoginButton.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor, constant: -20.0),
            controller.transferToLoginButton.heightAnchor.constraint(equalToConstant: 50.0)
        ]
    }
}
