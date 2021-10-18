//
//  TeamListViewState.swift
//  Week_4
//
//  Created by Tahir Esirgen on 15.10.2021.
//

import Foundation

typealias TeamListStateBlock = (TeamListViewState) -> Void

enum TeamListViewState {
    
    case loading
    case done
    case failure
    
}
