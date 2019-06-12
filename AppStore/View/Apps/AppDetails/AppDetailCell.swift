//
//  AppDetailCell.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-06-11.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit

class AppDetailCell: UICollectionViewCell {
    
    
    let nameLabl = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 16), numberOfLines: 2)
    let getBtn = UIButton(title: "$ 4.99 ")
    let appIconImageView = UIImageView(cornerRadius: 16)
    let whatNewLabl = UILabel(text: "What is New", font: .boldSystemFont(ofSize: 16))
    let releaseNoteLabl = UILabel(text: "release note ", font: .boldSystemFont(ofSize: 16))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupBtn()
        setUpAppIcon()
     let buttonSTV = UIStackView(arrangedSubviews: [
         getBtn,
        UIView()
        ],customSpacing: 0)
        let appsDetailSV = UIStackView(arrangedSubviews: [
            nameLabl,
            buttonSTV,
            UIView()
            ], customSpacing: 16)
          appsDetailSV.axis = .vertical
        appsDetailSV.alignment = .center
        
        let rootSV = UIStackView(arrangedSubviews: [
            appIconImageView,
            appsDetailSV
            ], customSpacing: 20)
            addSubview(rootSV)
            rootSV.fillSuperview(padding: .init(top: 20, left: 20, bottom: 40, right: 20))
    }
    func setUpAppIcon(){
        appIconImageView.backgroundColor = .yellow
        appIconImageView.constrainWidth(constant:140)
        appIconImageView.constrainHeight(constant:140)
    }
    func setupBtn(){
        getBtn.setTitleColor(.white, for: .normal)
        getBtn.constrainWidth(constant:80)
        getBtn.constrainHeight(constant: 32)
        getBtn.layer.cornerRadius = 16
        getBtn.backgroundColor = #colorLiteral(red: 0.03382426873, green: 0.5170981884, blue: 1, alpha: 1)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


