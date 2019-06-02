//
//  AppsPageHeader.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-05-30.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit
class AppsPageHeader: UICollectionReusableView {
    
    
    let appHeaderController = AppsHeaderController()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(appHeaderController.view)
        appHeaderController.view.fillSuperview()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
