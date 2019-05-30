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
        imgView.layer.cornerRadius = 64/4
        imgView.contentMode = .scaleToFill
        imgView.clipsToBounds = true
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
        button.setTitleColor(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        button.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 0.7409835189)
        button.widthAnchor.constraint(equalToConstant: 68).isActive = true
        button.heightAnchor.constraint(equalToConstant: 28).isActive = true
        button.layer.borderColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.1361033818)
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }()
    
    let screenshotImg1: UIImageView = {
        let imge1 = UIImageView()
        imge1.contentMode = .scaleToFill
       imge1.layer.borderColor = #colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 0.5290025685)
        imge1.layer.borderWidth = 0.5
        return imge1
    }()

    let screenshotImg2: UIImageView = {
    let imge2 = UIImageView()
    imge2.layer.borderColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 0.5288420377)
    imge2.layer.borderWidth = 0.5
    imge2.contentMode = .scaleToFill

    return imge2
    }()
    
    let screenshotImg3: UIImageView = {
    let imge3 = UIImageView()
    imge3.contentMode = .scaleToFill
    imge3.layer.borderWidth = 0.5
    imge3.layer.borderColor = #colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 0.5252300942)
        
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
