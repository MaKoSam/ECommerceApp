//
//  AuthViewController.swift
//  Shop
//
//  Created by Sam Mazniker on 19/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    var emailField = UITextField()
    var emailLabel = UILabel()
    
    var passwordField = UITextField()
    var passwordLabel = UILabel()
    
    var signInButton = UIButton()
    var constraints = [NSLayoutConstraint]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        emailField.addTarget(self, action: #selector(startEditingField(_:)), for: .allTouchEvents)
        passwordField.addTarget(self, action: #selector(startEditingField(_:)), for: .allTouchEvents)
        signInButton.addTarget(self, action: #selector(tryLogin(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate(constraints)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AuthViewController {
    @objc func startEditingField(_ sender: UITextField){
        sender.text = nil
    }
    
    @objc func tryLogin(_ sender: AnyObject){
        var authorize = Authorizator()
        if let email = self.emailField.text{
            if let pass = self.passwordField.text{
                authorize.signIn(with: email, password: pass){ error in
                    if error != nil {
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                    } else {
                        print("Success login")
                        //Successful login attempt action
                    }
                }
            }
        }
    }
}
