//
//  TeamListViewBuilder.swift
//  Week_4
//
//  Created by Tahir Esirgen on 15.10.2021.
//

import UIKit

class TeamListViewBuilder {
    
    class func build() -> UIViewController {
        let teamListFormatter = TeamListDataFormatter()
        let manager = TeamListOperationsManager.shared
        let viewModel = TeamListViewModel(formatter: teamListFormatter, operationManager: manager)
        let viewController = TeamListViewController(viewModel: viewModel)
        return viewController
    }
    
}

