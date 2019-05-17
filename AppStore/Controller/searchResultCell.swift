//
//  searchResultCell.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-05-17.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit

class searchResultCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = .purple
        imgView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        imgView.layer.cornerRadius = 12;
        return imgView
    }()
    
    let nameLabel: UILabel = {
        let nmeLabl = UILabel()
        nmeLabl.text = "My Apps"
        return nmeLabl
    }()
    
    let categoryLabel: UILabel = {
        let categorylabl = UILabel()
        categorylabl.text = "Photos & Videos"
        return categorylabl
    }()
    
    let ratingLabel: UILabel = {
        let ratingLabl = UILabel()
        ratingLabl.text = "9.26M"
        return ratingLabl
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        button.backgroundColor = UIColor.darkGray
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        
        let labelStackView  = UIStackView(arrangedSubviews: [
            nameLabel, categoryLabel, ratingLabel
            ])
            labelStackView.axis = .vertical
        let stackView = UIStackView(arrangedSubviews: [
            imageView, labelStackView, getButton
            ])
        stackView.spacing = 10
        stackView.alignment = .center
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
