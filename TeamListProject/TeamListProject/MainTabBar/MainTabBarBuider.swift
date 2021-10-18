//
//  MainTabBarBuider.swift
//  Week_4
//
//  Created by Tahir Esirgen on 14.10.2021.
//

import UIKit

class MainTabBarBuilder {
    
    class func build() -> UIViewController {
        
        let mainViewController = MainViewBuilder.build()
        let jumper = ViewController()
        jumper.title = "Jumper"
        jumper.tabBarItem.image = TabBarImages.bug.value
        jumper.tabBarItem.selectedImage = TabBarImages.bugSelected.value

        let tabViewController = MainTabBarController()
        tabViewController.viewControllers = [mainViewController]
        tabViewController.tabBar.tintColor = .black
        tabViewController.tabBar.backgroundColor = .systemBackground
        
        return tabViewController
        
    }
    
}

