//
//  AppGroupsCell.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-05-28.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit

class AppsPageCell: UICollectionViewCell
{
    let titleLabel = UILabel(text: "", font: .boldSystemFont(ofSize: 32))
    let HorizontontallAppController = HorizontalCollectionViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(HorizontontallAppController.view)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        HorizontontallAppController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
