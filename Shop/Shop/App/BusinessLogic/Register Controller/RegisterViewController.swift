//
//  RegisterViewController.swift
//  Shop
//
//  Created by Sam Mazniker on 20/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
//    var nameLabel = UILabel()
    var nameField = UITextField()
    
//    var emailLabel = UILabel()
    var emailField = UITextField()
    
//    var passwordLabel = UILabel()
    var passwordField = UITextField()
    
//    var passwordRepeatLabel = UILabel()
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
        var registrator = Registrator()
        if let name = nameField.text {
            if let email = emailField.text {
                if let pass1 = passwordField.text {
                    if let pass2 = passwordRepeatField.text {
                        if pass1.hashValue != pass2.hashValue{
                            let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
                            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            alertController.addAction(defaultAction)
                            self.present(alertController, animated: true, completion: nil)
                        } else {
                            registrator.signUp(with: email, and: pass1){ error in
                                if error != nil {
                                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                    alertController.addAction(defaultAction)
                                    self.present(alertController, animated: true, completion: nil)
                                } else {
                                    print("Success Register")
                                    //Отработка удачной регистрации
                                    //Навигация до магазина
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    @objc func navigateToLoginPage(_ sender: UIButton){
        let controllerBuiled = AuthControllerBuilder()
        var newController = controllerBuiled.buildDefaultController()
        self.navigationController?.pushViewController(newController, animated: true)
    }
}
