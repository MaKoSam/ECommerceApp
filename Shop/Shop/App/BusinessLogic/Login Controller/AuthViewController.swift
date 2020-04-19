//
//  AuthViewController.swift
//  Shop
//
//  Created by Sam Mazniker on 19/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    private var emailField = UITextField()
    private var emailLabel = UILabel()
    
    private var passwordField = UITextField()
    private var passwordLabel = UILabel()
    
    private var signInButton = UIButton()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.setUpViews()
        self.setUpConstraints()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AuthViewController {
    func setUpViews(){
        self.view.backgroundColor = UIColor.white
        
        emailLabel.text = "Login:"
        emailLabel.textAlignment = .center
        emailLabel.textColor = UIColor.black
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(emailLabel)
        
        passwordLabel.text = "Password:"
        passwordLabel.textAlignment = .center
        passwordLabel.textColor = UIColor.black
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(passwordLabel)
        
        emailField.text = "enter your email..."
        emailField.keyboardType = .emailAddress
        emailField.textContentType = .emailAddress
        emailField.addTarget(self, action: #selector(startEditingField(_:)), for: .touchUpInside)
        emailField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(emailField)
        
        passwordField.text = "enter your password..."
        passwordField.textContentType = .password
        passwordField.addTarget(self, action: #selector(startEditingField(_:)), for: .touchUpInside)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(passwordField)
        
        signInButton.titleLabel?.text = "Login"
        signInButton.addTarget(self, action: #selector(tryLogin(_:)), for: .touchUpInside)
        self.view.addSubview(signInButton)
    }
    
    @objc func startEditingField(_ sender: UITextField){
        sender.text = nil
    }
    
    @objc func tryLogin(_ sender: AnyObject){
        print("login initiated")
    }
    
    func setUpConstraints() {
        let constraints = [
            emailLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50.0),
            emailLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30.0),
            emailLabel.widthAnchor.constraint(equalToConstant: 50.0),
            emailLabel.heightAnchor.constraint(equalToConstant: 50.0),
            
            emailField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50.0),
            emailField.leadingAnchor.constraint(equalTo: emailLabel.trailingAnchor, constant: 20.0),
            emailField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 30.0),
            emailField.heightAnchor.constraint(equalToConstant: 50.0),
            
            passwordLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 50.0),
            passwordLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30.0),
            passwordLabel.widthAnchor.constraint(equalToConstant: 50.0),
            passwordLabel.heightAnchor.constraint(equalToConstant: 50.0),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 50.0),
            passwordField.leadingAnchor.constraint(equalTo: passwordLabel.trailingAnchor, constant: 20.0),
            passwordField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 30.0),
            passwordField.heightAnchor.constraint(equalToConstant: 50.0),
            
            signInButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30.0),
            signInButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 30.0),
            signInButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 50.0),
            signInButton.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
