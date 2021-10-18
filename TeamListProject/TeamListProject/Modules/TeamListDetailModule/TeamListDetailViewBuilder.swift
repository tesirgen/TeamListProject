//
//  TeamListDetailViewBuilder.swift
//  Week_4
//
//  Created by Tahir Esirgen on 17.10.2021.
//


import UIKit

class TeamListDetailViewBuilder {
    
    class func build() -> UIViewController {
        let teamListFormatter = TeamListDetailDataFormatter()
        let manager = TeamListOperationsManager.shared
        let viewModel = TeamListDetailViewModel(formatter: teamListFormatter, operationManager: manager)
        let viewController = TeamListDetailViewController(viewModel: viewModel)
        return viewController
    }
    
}
