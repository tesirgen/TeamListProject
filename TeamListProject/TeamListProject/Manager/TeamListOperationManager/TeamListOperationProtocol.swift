//
//  TeamListOperationProtocol.swift
//  Week_4
//
//  Created by Tahir Esirgen on 15.10.2021.
//

import Foundation
import RxSwift

protocol TeamListOperationProtocol{
    
    func getTeamListData()
    
    func subscribeDataPublisher(with completion: @escaping TeamListResultBlock) -> Disposable
    
    func subscribeDataFlow(with completion: @escaping (Bool) -> Void) -> Disposable
}
