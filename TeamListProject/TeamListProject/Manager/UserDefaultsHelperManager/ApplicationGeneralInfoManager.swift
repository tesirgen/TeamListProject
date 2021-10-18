//
//  ApplicationGeneralInfoManager.swift
//  Week_4
//
//  Created by Tahir Esirgen on 14.10.2021.
//

import Foundation
import UIKit

class ApplicationGeneralInfoManager: ApplicationGeneralInfoProtocol {
    
    func isTutorialViewSeen() -> Bool {
        return true
    }
    
    func setTutoralViewSeenForThisDevice() {
        
    }
    

    public static let shared = ApplicationGeneralInfoManager()
    
    private init() { }
    
    
}
