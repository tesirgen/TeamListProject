//
//  MainViewModel.swift
//  Week_4
//
//  Created by Tahir Esirgen on 14.10.2021.
//

import Foundation

class MainViewModel {
    
    private var tutorialFireBlock: (() -> Void)?
    
    private let applicationInfoManager: ApplicationGeneralInfoProtocol
    
    init(applicationInfoManager: ApplicationGeneralInfoProtocol) {
        self.applicationInfoManager = applicationInfoManager
        fireTutorial()
    }
    
    func listenTutorialEvent(with completion: @escaping (() -> Void)) {
        tutorialFireBlock = completion
    }
    
    func fireTutorial() {
        
        guard !applicationInfoManager.isTutorialViewSeen() else { return }

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.tutorialFireBlock?()
        }
    }
    
}
