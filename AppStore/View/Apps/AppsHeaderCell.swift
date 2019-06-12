//
//  AppsHeaderCell.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-05-30.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit
class AppsHeaderCell: UICollectionViewCell {
    
    let descriptionLabel = UILabel(text: "Welcome to Alkaida TV HQ,  Silicon Valley Branch ", font: .boldSystemFont(ofSize: 20))
    let companyNameLabel = UILabel(text: "Alkaida TV", font: .boldSystemFont(ofSize: 30))
    let ImageView = UIImageView(cornerRadius: 8)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [
            companyNameLabel, descriptionLabel,ImageView
            ])
        ImageView.image = UIImage(named: "profilimage")
        descriptionLabel.numberOfLines = 0
        companyNameLabel.textColor = .blue
        stackView.axis = .vertical
        stackView.spacing = 12
        addSubview(stackView)
        stackView.fillSuperview()
        ImageView.backgroundColor = .purple

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
