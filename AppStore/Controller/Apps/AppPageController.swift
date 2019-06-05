//
//  AppGroupsController.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-05-28.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit
class AppPageController: BaseController, UICollectionViewDelegateFlowLayout {
    
    var group = [appsGroup]()
    let activitorIndicator = UIActivityIndicatorView(style: .gray)
    var topGrossing, newApps, topFreeApss, topPaid, newGame : appsGroup?
    fileprivate let appId = "appid123"
    fileprivate let headerId = "headerId"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor(white: 0.99, alpha: 1)
        collectionView.register(AppsPageCell.self, forCellWithReuseIdentifier: appId)
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId )
        activitorIndicator.hidesWhenStopped = true
        fetchApps()
    }
    
     fileprivate func fetchApps()
    {

        
        let dispatchGroup = DispatchGroup()
        activitorIndicator.startAnimating()
       dispatchGroup.enter()
        NetworkService.shared.FetchTopGrossingApps { (apps, err) in
            dispatchGroup.leave()
            self.topGrossing  = apps
        }
        
        dispatchGroup.enter()
        NetworkService.shared.fetchNewApps { (apps, err) in
            dispatchGroup.leave()
            self.newApps = apps
        }
        dispatchGroup.enter()
        NetworkService.shared.topFreeApps { (apps, Error) in
            dispatchGroup.leave()
             self.topFreeApss = apps
        }
        dispatchGroup.enter()
        NetworkService.shared.fetChNewGames { (apps, err) in
            dispatchGroup.leave()
            self.newGame = apps
        }
        dispatchGroup.enter()
        NetworkService.shared.fetchtopPaidApp { (apps, err) in
        dispatchGroup.leave()
                self.topPaid = apps
            }
        dispatchGroup.notify(queue: .main){
            self.activitorIndicator.stopAnimating()
            if let app = self.newApps
            {
                self.group.append(app)
            }
            if let app = self.topGrossing
            {
                self.group.append(app)
            }
            if let app = self.topFreeApss
            {
                self.group.append(app)
            }
            if let app = self.topPaid
            {
                self.group.append(app)
            }
            if let app = self.newGame
            {
                self.group.append(app)
            }
            self.collectionView.reloadData()

        }
    }
    

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
     let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId , for: indexPath)
        return header
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return.init(width:view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return group.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appId, for: indexPath) as! AppsPageCell
        let AppGroup = group[indexPath.item]
        cell.titleLabel.text = AppGroup.feed.title
        cell.HorizontontallAppController.Group = AppGroup
        cell.HorizontontallAppController.collectionView.reloadData()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return.init(top: 16, left: 0, bottom: 0, right: 0)
    }
}
