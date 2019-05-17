//
//  TabBarController.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-05-16.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit

class TabBarController : UITabBarController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
        createNavController(viewController: UIViewController(), title: "Today", imageName: #imageLiteral(resourceName: "today_icon")),
        createNavController(viewController: UIViewController(), title: "Apps", imageName: #imageLiteral(resourceName: "apps")),
       createNavController(viewController: appSearchViewController(), title: "Search", imageName: #imageLiteral(resourceName: "search"))
    ]
    }
    
    fileprivate func createNavController(viewController : UIViewController, title:String, imageName: UIImage)->UIViewController{
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = imageName
        navController.tabBarItem.title = title
        navController.navigationBar.prefersLargeTitles = true
        return navController
    
    }
    
}

