//
//  searchResultCell.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-05-17.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit

class searchResultCell: UICollectionViewCell {
    
    let appIconImagView: UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = .red
        imgView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        imgView.leadingAnchor.constraint(equalTo: )
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
        button.backgroundColor = UIColor.lightGray
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.borderColor = UIColor.black.cgColor
        //button.layer.borderWidth = 1
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        return button
    }()
    
    let screenshotImg1: UIImageView = {
        let imge1 = UIImageView()
        imge1.backgroundColor = .blue
        return imge1
    }()

    let screenshotImg2: UIImageView = {
    let imge2 = UIImageView()
    imge2.backgroundColor = .blue
    return imge2
    }()
    
    let screenshotImg3: UIImageView = {
    let imge3 = UIImageView()
    imge3.backgroundColor = .blue
    return imge3
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        let applabelStackView  = UIStackView(arrangedSubviews: [
            nameLabel, categoryLabel, ratingLabel
            ])
            applabelStackView.axis = .vertical
        
        let screenshotStackView = UIStackView(arrangedSubviews: [
            screenshotImg1,screenshotImg2,screenshotImg3
            ])
        screenshotStackView.spacing = 12
        screenshotStackView.distribution = .fillEqually
        

        
        let appInfoStackView = UIStackView(arrangedSubviews: [
            appIconImagView, applabelStackView, getButton
            ])
        appInfoStackView.spacing = 12
        appInfoStackView.alignment = .center
        
        
        let rootStackView = UIStackView(arrangedSubviews: [
            appInfoStackView, screenshotStackView
    ])
        rootStackView.spacing = 12
        rootStackView.axis = .vertical
        
        addSubview(rootStackView)
        rootStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
