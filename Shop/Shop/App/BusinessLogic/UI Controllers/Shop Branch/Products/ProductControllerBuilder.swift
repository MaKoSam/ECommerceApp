//
//  ProductControllerBuilder.swift
//  Shop
//
//  Created by Sam Mazniker on 02/05/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

final class ProductControllerBuilder {
    let theme = Session.shared.theme
    
    func buildController() -> ProductViewController{
        var controller = ProductViewController()
        controller = configureViews(for: controller)
        controller.constraints = configureConstraints(for: controller)
        return controller
    }
    
    private func configureViews(for controller: ProductViewController) -> ProductViewController {
        controller.view.backgroundColor = theme.secondBackgroundColor
        
        controller.headline.text = Session.shared.translations["shop"]
        controller.headline.adjustsFontSizeToFitWidth = true
        controller.headline.textAlignment = .left
        controller.headline.textColor = theme.textColorBlack
        controller.headline.font = theme.fontBig
        controller.headline.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.headline)
        
        controller.menuButton.setImage(UIImage(named: "menu.png"), for: .normal)
        controller.menuButton.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.menuButton)
        
        controller.searchButton.setImage(UIImage(named: "search.png"), for: .normal)
        controller.searchButton.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.searchButton)
        
        controller.cartButton.setImage(UIImage(named: "cart.png"), for: .normal)
        controller.cartButton.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.cartButton)
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        let categoryLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        categoryLayout.itemSize = CGSize(width: screenWidth / 4, height: 60.0)
        categoryLayout.minimumLineSpacing = 10
        categoryLayout.minimumInteritemSpacing = 10
        categoryLayout.scrollDirection = .horizontal
        controller.categoryMenu.collectionViewLayout = categoryLayout
        controller.categoryMenu.backgroundColor = theme.secondBackgroundColor
        controller.categoryMenu.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.categoryMenu)
        
        controller.productList.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(controller.productList)
        return controller
    }
    
    private func configureConstraints(for controller: ProductViewController) -> [NSLayoutConstraint] {
        return [
            controller.menuButton.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 60.0),
            controller.menuButton.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 14.0),
            controller.menuButton.heightAnchor.constraint(equalToConstant: 20.0),
            controller.menuButton.widthAnchor.constraint(equalToConstant: 20.0),
            
            controller.cartButton.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 60.0),
            controller.cartButton.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -14.0),
            controller.cartButton.heightAnchor.constraint(equalToConstant: 20.0),
            controller.cartButton.widthAnchor.constraint(equalToConstant: 20.0),
            
            controller.searchButton.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 60.0),
            controller.searchButton.trailingAnchor.constraint(equalTo: controller.cartButton.leadingAnchor, constant: -14.0),
            controller.searchButton.heightAnchor.constraint(equalToConstant: 20.0),
            controller.searchButton.widthAnchor.constraint(equalToConstant: 20.0),
            
            controller.headline.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 100.0),
            controller.headline.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 14.0),
            controller.headline.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -14.0),
            controller.headline.heightAnchor.constraint(equalToConstant: 34.0),
            
            controller.categoryMenu.topAnchor.constraint(equalTo: controller.headline.bottomAnchor, constant: 20.0),
            controller.categoryMenu.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 0.0),
            controller.categoryMenu.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: 0.0),
            controller.categoryMenu.heightAnchor.constraint(equalToConstant: 60.0),
            
            controller.productList.topAnchor.constraint(equalTo: controller.categoryMenu.bottomAnchor, constant: 0.0),
            controller.productList.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 0.0),
            controller.productList.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: 0.0),
            controller.productList.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor, constant: 0.0)
        ]
    }
}
