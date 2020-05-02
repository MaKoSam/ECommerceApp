//
//  CategoryViewCell.swift
//  Shop
//
//  Created by Sam Mazniker on 02/05/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

final class CategoryViewCell: UICollectionViewCell {
    var categoryLabel: UILabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        categoryLabel.textAlignment = .center
        categoryLabel.textColor = Session.shared.theme.textColorWhite
        categoryLabel.font = Session.shared.theme.fontMedium
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(categoryLabel)
        
        categoryLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0.0).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0.0).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0.0).isActive = true
        categoryLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0.0).isActive = true
    }
    
    override func prepareForReuse() {
        self.categoryLabel.text = nil
    }
}
