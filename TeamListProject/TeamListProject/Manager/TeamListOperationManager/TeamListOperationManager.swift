//
//  TeamListOperationManager.swift
//  Week_4
//
//  Created by Tahir Esirgen on 15.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage
import RxSwift

typealias TeamListResult = Result<TeamsResponse, ErrorResponse>
typealias TeamListResultBlock = (Result<TeamsResponse, ErrorResponse>) -> Void
class TeamListOperationsManager: TeamListOperationProtocol {
    
    public static let shared = TeamListOperationsManager()
    
    private init() { }
    
    private let dataPublishSubject = PublishSubject<TeamListResult>()
    private let dataFlowSubject = PublishSubject<Bool>()
    
    // MARK: - Public Methods
    func getTeamListData() {
        fireApiCall(with: apiCallHandler)
    }
    
    func subscribeDataPublisher(with completion: @escaping TeamListResultBlock) -> Disposable {
        return dataPublishSubject.subscribe(onNext: completion)
    }
    
    func subscribeDataFlow(with completion: @escaping (Bool) -> Void) -> Disposable {
        return dataFlowSubject.subscribe(onNext: completion)
    }
    
    // MARK: - Private Methods
    private func fireApiCall(with completion: @escaping TeamListResultBlock) {
        
        dataFlowSubject.onNext(false)
        
        do {
            let urlRequest = try TeamsApiServiceProvider(headers: HeaderProvider()).returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error {
            print("error : \(error)")
        }
        
    }
    
    // MARK: - CallBack Listener
    private lazy var apiCallHandler: (Result<TeamsResponse, ErrorResponse>) -> Void = { [weak self] result in
        // to show how to handle error .....
        self?.dataPublishSubject.onNext(result)
        self?.dataFlowSubject.onNext(true)

    }
    
}
