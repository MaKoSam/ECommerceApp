//
//  RootViewController.swift
//  Shop
//
//  Created by Sam Mazniker on 18/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

// Контроллер отвечает за отработку переходов между главными линиями приложения
// Вход -> Логин or Вход -> Main
// Логин -> Main or Main -> Log out

import UIKit

class RootViewController: UIViewController {
    private var current: UIViewController
    
    init() {
        let controllerBuilder = LaunchControllerBuilder()
        self.current = controllerBuilder.buildDefaultController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        addChild(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParent: self)
    }
    
    func showLoginBranch() {
        let controllerBuilder = RegisterControllerBuilder()
        let new = UINavigationController(rootViewController: controllerBuilder.buildDefaultController())
        
        addChild(new)
        new.view.frame = view.bounds
        view.addSubview(new.view)
        new.didMove(toParent: self)
        
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = new
    }
    
    func showMainBranch() {
        let new = UINavigationController(rootViewController: ShopViewController())
        
        addChild(new)
        new.view.frame = view.bounds
        view.addSubview(new.view)
        new.didMove(toParent: self)
        
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = new
    }
    
    func showLogoutBranch() {
        let userManager = UserManager()
        userManager.logout()
    }

}
