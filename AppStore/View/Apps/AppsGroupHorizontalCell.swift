//
//  AppsGroupHorizontalCell.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-05-29.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit


class AppsGroupHorizontalCell: UICollectionViewCell {
    let getButton = UIButton(title: "GET")
    let nameLabl = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 20))
    let companyTitle = UILabel(text: "Facbook", font: .boldSystemFont(ofSize: 16))
    let AppImageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        AppImageView.constrainWidth(constant: 60)
        AppImageView.constrainHeight(constant: 60)
        AppImageView.backgroundColor = .purple
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainHeight(constant: 32)
        getButton.constrainWidth(constant: 64)
        getButton.layer.cornerRadius = 16
        getButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        
        let verticalStackView = UIStackView(arrangedSubviews: [
            nameLabl, companyTitle
            ])
        verticalStackView.axis = .vertical
        
        let stackview = UIStackView(arrangedSubviews: [
            AppImageView,verticalStackView, getButton
            ])
        
        
        addSubview(stackview)
        stackview.spacing = 16
        stackview.alignment = .center
        stackview.fillSuperview()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
