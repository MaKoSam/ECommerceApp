//
//  RegisterViewController.swift
//  Shop
//
//  Created by Sam Mazniker on 20/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    var nameField = UITextField()
    var emailField = UITextField()
    var passwordField = UITextField()
    var passwordRepeatField = UITextField()
    
    var registerButton = UIButton()
    
    var transferToLoginLabel = UILabel()
    var transferToLoginButton = UIButton()
    
    var constraints = [NSLayoutConstraint]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameField.addTarget(self, action: #selector(startEditingField(_:)), for: .allTouchEvents)
        emailField.addTarget(self, action: #selector(startEditingField(_:)), for: .allTouchEvents)
        passwordField.addTarget(self, action: #selector(startEditingField(_:)), for: .allTouchEvents)
        passwordRepeatField.addTarget(self, action: #selector(startEditingField(_:)), for: .allTouchEvents)
        
        registerButton.addTarget(self, action: #selector(tryRegister(_:)), for: .touchUpInside)
        transferToLoginButton.addTarget(self, action: #selector(navigateToLoginPage(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}




extension RegisterViewController{
    @objc func startEditingField(_ sender: UITextField){
        sender.text = nil
    }
    
    @objc func tryRegister(_ sender: UIButton){
        let registrator = Registrator()
        guard let username = self.nameField.text,
            let passwordOne = self.passwordField.text,
            let passwordTwo = self.passwordRepeatField.text,
            let email = self.emailField.text else {
                showError()
                return
        }
        
        if checkPasswords(first: passwordOne, second: passwordTwo){
            registrator.signUp(with: username, password: passwordOne, email: email){ user in
                guard let user = user else {
                    self.showError()
                    return
                }
                DispatchQueue.global(qos: .background).async {
                    print("Turning to saving", user)
                    Session.shared.setUser(user)
                    let userManager = UserManager()
                    userManager.saveUser(user: user)
                    DispatchQueue.main.async {
                        AppDelegate.shared.rootViewController.showMainBranch() //Навигация до магазина
                    }
                }
            }
        }
        
    }
    
    private func checkPasswords(first: String, second: String) -> Bool{
        if first.hashValue != second.hashValue || first.count < 6{
            showError()
            return false
        }
        return true
    }
    
    private func showError(error: Error? = nil){
        var errorMessage: String?
        if error == nil {
            errorMessage = "Username is bad formatted or already taken. Password must be 6 or more symbols."
        } else {
            errorMessage = error?.localizedDescription
        }
        let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func navigateToLoginPage(_ sender: UIButton){
        let controllerBuiled = AuthControllerBuilder()
        self.navigationController?.pushViewController(controllerBuiled.buildDefaultController(), animated: true)
    }
}
