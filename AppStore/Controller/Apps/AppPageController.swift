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
    var socialApp = [Socialmedia]()
    let activitorIndicator = UIActivityIndicatorView(style: .gray)
    var topGrossing, topFree, newApps, topFreeApss, topPaid, newGame : appsGroup?
    
    let activityIndicator : UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.color = .black
        aiv.hidesWhenStopped = true
        aiv.startAnimating()
        return aiv
    }()
    fileprivate let appId = "appid123"
    fileprivate let headerId = "headerId"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor(white: 0.99, alpha: 1)
        collectionView.register(AppsPageCell.self, forCellWithReuseIdentifier: appId)
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId )
        view.addSubview(activityIndicator)
        activityIndicator.fillSuperview()
        fetchApps()
    }
    
    fileprivate func fetchApps()
    {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        ApiNetworkService.shared.fetchSocialMediaApps { (Socialapp, err) in
            dispatchGroup.leave()
            if let socialapps = Socialapp{
                self.socialApp = socialapps
            }
        }
        dispatchGroup.enter()
        ApiNetworkService.shared.fetchTopFree { (apps, err) in
            dispatchGroup.leave()
            self.topFree = apps
        }
        
        dispatchGroup.enter()
        ApiNetworkService.shared.fetchNewApps { (apps, err) in
            dispatchGroup.leave()
            self.newApps = apps
        }
        dispatchGroup.enter()
        ApiNetworkService.shared.topFreeApps { (apps, Error) in
            dispatchGroup.leave()
            self.topFreeApss = apps
        }
        dispatchGroup.enter()
        ApiNetworkService.shared.fetChNewGames { (apps, err) in
            dispatchGroup.leave()
            self.newGame = apps
        }
        dispatchGroup.enter()
        ApiNetworkService.shared.fetchtopPaidApp { (apps, err) in
            dispatchGroup.leave()
            self.topPaid = apps
        }
        
        dispatchGroup.enter()
        ApiNetworkService.shared.FetchTopGrossingApps { (apps, err) in
            dispatchGroup.leave()
            self.topGrossing  = apps
        }
        
        dispatchGroup.notify(queue: .main){
            self.activityIndicator.stopAnimating()
            if let app = self.newApps
            {
                self.group.append(app)
            }
            if let app = self.topFree{
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
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId , for: indexPath) as! AppsPageHeader
        headerCell.appHeaderController.socialApps = socialApp
        headerCell.appHeaderController.collectionView.reloadData()
        return headerCell
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
        cell.HorizontontallAppController.didSelecthandler = {[weak self] selectItem in
            let appDetailsVC = AppDetailsController()
            appDetailsVC.navigationItem.title = selectItem.artistName
            appDetailsVC.appId = selectItem.id
            self?.navigationController?.pushViewController(appDetailsVC, animated: true)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return.init(top: 16, left: 0, bottom: 0, right: 0)
    }
}
