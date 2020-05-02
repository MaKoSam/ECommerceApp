//
//  ItemViewCell.swift
//  Shop
//
//  Created by Sam Mazniker on 02/05/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class ItemViewCell: UICollectionViewCell {
    var image = UIImageView()
    var name = UILabel()
    var price = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        image.backgroundColor = UIColor.white
        image.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(image)
        
        name.textColor = Session.shared.theme.buttonColor
        name.font = Session.shared.theme.fontMedium
        name.textAlignment = .center
        name.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(name)
        
        price.textColor = Session.shared.theme.buttonColor
        price.font = Session.shared.theme.fontSmall
        price.textAlignment = .center
        price.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(price)
        
        let imageSize = self.contentView.bounds.width
        image.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10.0).isActive = true
        image.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0.0).isActive = true
        image.widthAnchor.constraint(equalToConstant: imageSize - 5.0).isActive = true
        image.heightAnchor.constraint(equalToConstant: imageSize - 5.0).isActive = true
        
        name.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10.0).isActive = true
        name.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0.0).isActive = true
        name.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0.0).isActive = true
        name.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        price.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10.0).isActive = true
        price.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0.0).isActive = true
        price.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0.0).isActive = true
        price.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        name.text = nil
        price.text = nil
    }
}
