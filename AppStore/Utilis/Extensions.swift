//
//  Extensions.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-05-29.
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
extension UIImageView{
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
}


extension UIButton{
    convenience init(title: String){
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}
