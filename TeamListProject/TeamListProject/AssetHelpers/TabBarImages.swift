//
//  TabBarImages.swift
//  Week_4
//
//  Created by Tahir Esirgen on 14.10.2021.
//

import UIKit

enum TabBarImages: String, GenericValueProtocol {

    typealias Value = UIImage
    
    var value: UIImage {
        return UIImage(imageLiteralResourceName: rawValue)
    }
    
    case home = "home"
    case favorite = "favorite"
    case homeSelected = "homeSelected"
    case favoriteSelected = "favoriteSelected"
    case bug = "bug"
    case bugSelected = "bugSelected"
    
}
