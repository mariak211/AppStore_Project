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
        
        let todayViewController = UIViewController();
        todayViewController.view.backgroundColor = .white
        let todayNavController = UINavigationController(rootViewController: todayViewController)
        todayViewController.navigationItem.title = "Today"
        todayNavController.tabBarItem.image = #imageLiteral(resourceName: "today_icon")
        todayNavController.navigationBar.prefersLargeTitles = true
        
        
        let appViewController = UIViewController();
        appViewController.view.backgroundColor = .white
         let appNavController = UINavigationController(rootViewController: appViewController)
        appViewController.navigationItem.title = "Apps"
        appNavController.tabBarItem.image = #imageLiteral(resourceName: "apps")
        appNavController.navigationBar.prefersLargeTitles = true
    
        let searchViewCOntroller = UIViewController();
        searchViewCOntroller.view.backgroundColor = .white
        let searchNavController = UINavigationController(rootViewController: searchViewCOntroller)
        searchViewCOntroller.navigationItem.title = "Search"
        searchNavController.tabBarItem.image = #imageLiteral(resourceName: "search")
        searchNavController.navigationBar.prefersLargeTitles = true
        
        
        
        viewControllers = [
        todayNavController,
        appNavController,
        searchNavController]
        
        
    }
    
    
}

