//
//  BaseController.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-05-24.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit

class BaseController: UICollectionViewController{
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
