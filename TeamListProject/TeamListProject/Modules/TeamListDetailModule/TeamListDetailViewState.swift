//
//  TeamListDetailViewState.swift
//  Week_4
//
//  Created by Tahir Esirgen on 17.10.2021.
//

import Foundation

typealias TeamListDetailStateBlock = (TeamListDetailViewState) -> Void

enum TeamListDetailViewState {
    
    case loading
    case done
    case failure
    
}
