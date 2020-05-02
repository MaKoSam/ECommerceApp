//
//  ProductViewController.swift
//  Shop
//
//  Created by Sam Mazniker on 02/05/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    var menuButton = UIButton()
    var searchButton = UIButton()
    var cartButton = UIButton()
    var headline = UILabel()
    
    var categoryMenu = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
    var productList = ItemView()
    
    var constraints = [NSLayoutConstraint]()
    
    var categories = [Category]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        NSLayoutConstraint.activate(constraints)
        categories = Session.shared.shopManager.categoryManager.getAll()
        productList.itemList = Session.shared.shopManager.itemManager.getAll()
        categoryMenu.register(CategoryViewCell.self, forCellWithReuseIdentifier: "category")
        categoryMenu.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProductViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newCell: CategoryViewCell = categoryMenu.dequeueReusableCell(withReuseIdentifier: "category", for: indexPath) as! CategoryViewCell
        newCell.categoryLabel.text = categories[indexPath.row].name
        newCell.layoutSubviews()
        return newCell
    }
    
    
}
