//
//  MainViewController.swift
//  Week_4
//
//  Created by Tahir Esirgen on 14.10.2021.
//

import UIKit

extension Selector {
    static let testButtonTapped = #selector(MainViewController.testButtonAction)
}

class MainViewController: BaseViewController<MainViewModel> {

    private let image = UIImage(named: "Futbol.jpg")
    private lazy var test: UIButton = {
        let temp = UIButton(type: .system)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.addTarget(self, action: .testButtonTapped, for: .touchUpInside)
        temp.setTitle("PUSH", for: .normal)
        temp.titleLabel?.font = UIFont(name: "Arial", size: 20)
        temp.setTitleColor(.black, for: .normal)
        temp.frame.size = CGSize(width: 50.0, height: 50.0)
        temp.backgroundColor = #colorLiteral(red: 0.8671453595, green: 0.918800354, blue: 0.5532771349, alpha: 1)
        return temp
    }()
    
    private lazy var imageView: UIImageView = {
        let temp = UIImageView(image: image)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFill
        return temp
    }()
    
    
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        //view.backgroundColor = .green
        view.addSubview(imageView)
        view.addSubview(test)
        
        
        NSLayoutConstraint.activate([
        
            test.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            test.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 45.0),
            
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func testButtonAction(_ sender: UIButton) {
        
        fireCharacterListView()
        
//        let viewController = TestViewController()
//        viewController.title = "TEST"
////        self.navigationController?.pushViewController(viewController, animated: true)
////
//        let newNavigationController = UINavigationController(rootViewController: viewController)
//        newNavigationController.navigationBar.backgroundColor = .red
//        newNavigationController.navigationBar.tintColor = .green
//        self.present(newNavigationController, animated: true, completion: nil)
    }
    
    private func fireCharacterListView() {
        let characterListView = TeamListViewBuilder.build()
        self.navigationController?.pushViewController(characterListView, animated: true)
    }
    
    
    
    
    
}
