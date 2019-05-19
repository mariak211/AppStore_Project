//
//  appSearchViewController.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-05-16.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit

class appSearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    fileprivate let cellId  = "alkaida211"
    fileprivate var appSearchResult = [Result]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(searchResultCell.self, forCellWithReuseIdentifier: cellId)
    
        fetchItuneApps()
    }
    
    fileprivate func fetchItuneApps(){

        NetworkService.shared.fetchApps { (results) in
            self.appSearchResult = results
            DispatchQueue.main.async {
             self.collectionView.reloadData()
            }
        }
        
    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return.init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return appSearchResult.count
        
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! searchResultCell
        cell.layer.borderColor = UIColor.black.cgColor
        let appSearchReslt = appSearchResult[indexPath.item]
        cell.nameLabel.text = appSearchReslt.trackName
        cell.categoryLabel.text = appSearchReslt.primaryGenreName
        cell.ratingLabel.text = "Rating: \(appSearchReslt.averageUserRating ?? 0) M"
          return cell
    }
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

