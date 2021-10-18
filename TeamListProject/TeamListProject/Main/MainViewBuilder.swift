//
//  MainViewBuilder.swift
//  Week_4
//
//  Created by Tahir Esirgen on 14.10.2021.
//

import UIKit

class MainViewBuilder {
    
    class func build() -> UIViewController {

        let viewModel = MainViewModel(applicationInfoManager: ApplicationGeneralInfoManager.shared)
        let viewController = MainViewController(viewModel: viewModel)
        let navigationViewController = UINavigationController(rootViewController: viewController)
        viewController.title = "Team List"
        viewController.tabBarItem.image = TabBarImages.home.value
        viewController.tabBarItem.selectedImage = TabBarImages.homeSelected.value
        navigationViewController.navigationBar.tintColor = .cyan
        viewController.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        viewController.navigationController?.navigationBar.standardAppearance = appearance;
        viewController.navigationController?.navigationBar.scrollEdgeAppearance = viewController.navigationController?.navigationBar.standardAppearance

        return navigationViewController

    }
    
}
