//
//  HorizontalAppsController.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-05-28.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit
import SDWebImage
class HorizontalCollectionViewController: BaseController, UICollectionViewDelegateFlowLayout {
    var Group:appsGroup?
    let cellId = "Cellid"
   
    var didSelecthandler: ((FeedResult) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupHorizontalCell.self, forCellWithReuseIdentifier: cellId)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
        }
    }
    
    let lineSpacing : CGFloat = 10
    let topBottomPadding : CGFloat = 12
    let rightLeftPadding : CGFloat = 12
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Group?.feed.results.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupHorizontalCell
        let apps = Group?.feed.results[indexPath.item]

        cell.nameLabl.text = apps?.artistName
        cell.companyTitle.text = apps?.name
        let url = URL(string: apps?.artworkUrl100 ?? "")
        cell.AppImageView.sd_setImage(with: url, completed: nil)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - (2*lineSpacing + 2*topBottomPadding))/3
        let width = (view.frame.width - 48)
        return .init(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomPadding, left: rightLeftPadding , bottom: topBottomPadding, right: rightLeftPadding )
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedItem = Group?.feed.results[indexPath.item]{
             didSelecthandler?(selectedItem)
        }
       
    }
}
