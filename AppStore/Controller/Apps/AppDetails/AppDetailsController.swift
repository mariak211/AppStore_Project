//
//  AppDetailsController.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-06-09.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit

class AppDetailsController: BaseController, UICollectionViewDelegateFlowLayout {
    let detailCellId = "detailCellId"
    var appId: String!{
        didSet{
            if let id = appId{
            let urlString = "https://itunes.apple.com/lookup?id=\(id)"
                ApiNetworkService.shared.genericApiDataFetch(urlString: urlString) { (app: SearchResult?, error) in
                    //more work to be done here
                }
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCellId)
    
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let detailCell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId, for: indexPath)
        return detailCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return.init(width: view.frame.width, height: 300)
    }
}
