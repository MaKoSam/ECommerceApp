//
//  RegisterViewController.swift
//  Shop
//
//  Created by Sam Mazniker on 20/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    var headline = UILabel()
    
    var usernameView = UIView()
    var emailView = UIView()
    var passwordView = UIView()
    var passwordRepeatView = UIView()
    
    var usernameLabel = UILabel()
    var emailLabel = UILabel()
    var passwordLabel = UILabel()
    var passwordRepeatLabel = UILabel()
    
    var usernameField = UITextField()
    var emailField = UITextField()
    var passwordField = UITextField()
    var passwordRepeatField = UITextField()
    
    var registerButton = UIButton()
    
    var transferToLoginLabel = UILabel()
    var transferToLoginButton = UIButton()
    
    var constraints = [NSLayoutConstraint]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameField.addTarget(self, action: #selector(startEditingField(_:)), for: .allTouchEvents)
        emailField.addTarget(self, action: #selector(startEditingField(_:)), for: .allTouchEvents)
        passwordField.addTarget(self, action: #selector(startEditingField(_:)), for: .allTouchEvents)
        passwordRepeatField.addTarget(self, action: #selector(startEditingField(_:)), for: .allTouchEvents)
        
        registerButton.addTarget(self, action: #selector(tryRegister(_:)), for: .touchUpInside)
        transferToLoginButton.addTarget(self, action: #selector(navigateToLoginPage(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate(constraints)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(endEditTap(sender:)))
        self.view.addGestureRecognizer(tap)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillShowNotification)
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillHideNotification)
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillChangeFrameNotification)
    }
    
}



//RegisterActions
extension RegisterViewController{
    @objc func startEditingField(_ sender: UITextField){
        sender.text = nil
    }
    
    @objc func tryRegister(_ sender: UIButton){
        let registrator = Registrator()
        guard let username = self.usernameField.text,
            let passwordOne = self.passwordField.text,
            let passwordTwo = self.passwordRepeatField.text,
            let email = self.emailField.text else {
                showError(message: "Заполните все поля")
                return
        }
        
        if checkPasswords(first: passwordOne, second: passwordTwo){
            registrator.signUp(with: username, password: passwordOne, email: email){ user in
                guard let user = user else {
                    self.showError(message: "Логин уже занят")
                    return
                }
                DispatchQueue.global(qos: .background).async {
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
            showError(message: "Пароли не совпадают")
            return false
        }
        return true
    }
    
    private func showError(error: Error? = nil, message: String? = nil){
        var errorMessage = message
        if error == nil && message == nil {
            errorMessage = "Username is bad formatted or already taken. Password must be 6 or more symbols."
        } else if message == nil {
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

//Keyboard events
extension RegisterViewController {
    @objc func endEditTap(sender: Any){
        self.usernameField.endEditing(true)
        self.emailField.endEditing(true)
        self.passwordField.endEditing(true)
        self.passwordRepeatField.endEditing(true)
    }
    
    @objc func keyboardWillChange(notification: Notification){
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification{
            self.view.frame.origin.y = -keyboardRect.height
        } else {
            self.view.frame.origin.y = 0
        }
    }
}
