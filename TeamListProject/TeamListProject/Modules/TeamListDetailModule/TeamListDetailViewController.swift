//
//  TeamListDetailViewController.swift
//  Week_4
//
//  Created by Tahir Esirgen on 17.10.2021.
//

import UIKit

class TeamListDetailViewController: BaseViewController<TeamListDetailViewModel> {
    
    deinit {
        print("DEINIT TeamListViewController")
    }
    
    //private var mainComponent: mainComponent!
    private var mainComponent: ItemListView!

    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        // adding major components
        addmainComponent()
        
        // listen view states
        subscribeViewModelListeners()
        
        // fire getting data
        viewModel.getCharacterList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func addmainComponent() {
        //mainComponent = mainComponent()
        mainComponent = ItemListView()
        mainComponent.translatesAutoresizingMaskIntoConstraints = false
        
        mainComponent.delegate = viewModel
        
        view.addSubview(mainComponent)
        
        NSLayoutConstraint.activate([
        
            mainComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainComponent.topAnchor.constraint(equalTo: view.topAnchor),
            mainComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
            
        ])
    }
    
    private func subscribeViewModelListeners() {
        
        viewModel.subscribeState { [weak self] state in
            switch state {
            case .done:
                print("data is ready")
                self?.mainComponent.reloadTableView()
            case .loading:
                print("data is getting")
            case .failure:
                print("errror")
                // show alert popup
            }
        }
    }
    
}
