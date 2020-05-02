//
//  ItemView.swift
//  Shop
//
//  Created by Sam Mazniker on 02/05/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class ItemView: UIView {
    var itemCollectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
    
    var itemList = [ShopItem]()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenWidth / 2, height: screenWidth / 2 + 100.0)
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        itemCollectionView.collectionViewLayout = layout
        itemCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(itemCollectionView)
        
        itemCollectionView.register(ItemViewCell.self, forCellWithReuseIdentifier: "item")
        itemCollectionView.dataSource = self
        
        itemCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0).isActive = true
        itemCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0).isActive = true
        itemCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0).isActive = true
        itemCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0).isActive = true
    }
}

extension ItemView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newCell: ItemViewCell = itemCollectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! ItemViewCell
        newCell.name.text = itemList[indexPath.row].name
        newCell.price.text = "\(itemList[indexPath.row].price)"
        newCell.layoutSubviews()
        return newCell
    }
    
    
}
