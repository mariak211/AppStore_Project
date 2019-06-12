//
//  AppsHeaderController.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-05-30.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit
class AppsHeaderController: BaseController, UICollectionViewDelegateFlowLayout {
    
    var flag: Bool?
    var socialApps = [Socialmedia]()
    let cellHeaderId = "HeaderIdCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellHeaderId)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (socialApps.count > 1)
        {
            flag = true
             return socialApps.count
        }else
        {
            return 5
        }
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellHeaderId, for: indexPath) as! AppsHeaderCell
        if flag == true{
            let social = socialApps[indexPath.item]
            cell.companyNameLabel.text = social.name
            cell.descriptionLabel.text = social.tagline
            cell.ImageView.sd_setImage(with: URL(string: social.imageUrl))
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 16, bottom: 0, right: 16)
    }
}
