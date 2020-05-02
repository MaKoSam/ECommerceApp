//
//  AuthViewController.swift
//  Shop
//
//  Created by Sam Mazniker on 19/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    var headline = UILabel()
    
    var usernameView = UIView()
    var passwordView = UIView()
    
    var usernameLabel = UILabel()
    var passwordLabel = UILabel()
    
    var usernameField = UITextField()
    var passwordField = UITextField()
    
    var signInButton = UIButton()
    
    var constraints = [NSLayoutConstraint]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        usernameField.addTarget(self, action: #selector(startEditingField(_:)), for: .allTouchEvents)
        passwordField.addTarget(self, action: #selector(startEditingField(_:)), for: .allTouchEvents)
        signInButton.addTarget(self, action: #selector(tryLogin(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate(constraints)
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

//Auth Actions
extension AuthViewController {
    @objc func startEditingField(_ sender: UITextField){
        sender.text = nil
    }
    
    @objc func tryLogin(_ sender: AnyObject){
        let authorize = Authorizator()
        guard let username = self.usernameField.text,
            let password = self.passwordField.text else {
                showError()
                return
        }
        
        authorize.signIn(with: username, password: password){ user in
            guard let user = user else {
                self.showError()
                return
            }
            DispatchQueue.main.async {
                Session.shared.setUser(user)
                AppDelegate.shared.rootViewController.showMainBranch() //Навигация до магазина
            }
            DispatchQueue.global(qos: .background).async {
                let userManager = UserManager()
                userManager.saveUser(user: user)
            }
        }
    }
    
    private func showError(error: Error? = nil){
        var errorMessage: String?
        if error == nil {
            errorMessage = "Пользователь несуществует или введен неправильный пароль."
        } else {
            errorMessage = error?.localizedDescription
        }
        let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

//Keyboard Actions
extension AuthViewController {
    @objc func endEditTap(sender: Any){
        self.usernameField.endEditing(true)
        self.passwordField.endEditing(true)
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
