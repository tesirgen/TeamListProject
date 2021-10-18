//
//  TeamListViewController.swift
//  Week_4
//
//  Created by Tahir Esirgen on 15.10.2021.
//

import UIKit
extension Selector {
    static let testButtonTapped2 = #selector(TeamListViewController.testButtonAction2)
}
class TeamListViewController: BaseViewController<TeamListViewModel> {
    
    deinit {
        print("DEINIT TeamListViewController")
    }
    private lazy var test: UIButton = {
        let temp = UIButton(type: .system)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.addTarget(self, action: .testButtonTapped2, for: .touchUpInside)
        temp.setTitle("Details..", for: .normal)
        temp.titleLabel?.font = UIFont(name: "Arial", size: 20)
        temp.setTitleColor(.black, for: .normal)
        temp.frame.size = CGSize(width: 20.0, height: 20.0)
        return temp
    }()
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
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: test)
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
    @objc func testButtonAction2(_ sender: UIButton) {
        fireCharacterListView()
    }
    
    private func fireCharacterListView() {
        let characterListView = TeamListDetailViewBuilder.build()
        self.navigationController?.pushViewController(characterListView, animated: true)
    }
}

