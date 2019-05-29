//
//  AppGroupsCell.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-05-28.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit
extension UILabel{
    convenience init(text: String, font:UIFont)
    {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
    
}
class AppGroupsCell: UICollectionViewCell
{
    let titleLabel = UILabel(text: "Apps Section", font: .boldSystemFont(ofSize: 32))
    let HorizontontallAppController = HorizontalCollectionViewCOntroller()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        addSubview(titleLabel)
        addSubview(HorizontontallAppController.view)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        //HorizontontallAppController.view.backgroundColor = .blue
        HorizontontallAppController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}
