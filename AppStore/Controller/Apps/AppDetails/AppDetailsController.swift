//
//  AppDetailsController.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-06-09.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit

class AppDetailsController: BaseController, UICollectionViewDelegateFlowLayout {
    var Item : SearchResult?
    let detailCellId = "detailCellId"
    var appId: String!{
        didSet{
            if let id = appId{
            let urlString = "https://itunes.apple.com/lookup?id=\(id)"
                print("url:", urlString)
                ApiNetworkService.shared.genericApiDataFetch(urlString: urlString) { (app: SearchResult?, error) in
                    print(app?.results.first?.trackName)
                    if let apps = app
                    {
                        print("price:", apps.results.first?.formattedPrice)
                         self.Item = app
                    }
                    DispatchQueue.main.async {
                       self.collectionView.reloadData()
                    }
                }
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCellId)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let detailCell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId, for: indexPath) as! AppDetailCell
        if let app = Item?.results[indexPath.item]
        {
            detailCell.getBtn.setTitle(app.formattedPrice, for: .normal)
            detailCell.nameLabl.text = app.trackName
            detailCell.appIconImageView.sd_setImage(with: URL(string: app.artworkUrl100))
        }
        
        return detailCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return.init(width: view.frame.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 16)
    }
}
