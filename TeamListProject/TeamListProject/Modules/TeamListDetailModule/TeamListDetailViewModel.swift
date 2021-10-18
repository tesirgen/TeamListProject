//
//  TeamListDetailViewModel.swift
//  Week_4
//
//  Created by Tahir Esirgen on 17.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage
import RxSwift

class TeamListDetailViewModel {
    
    deinit {
        print("DEINIT TeamListDetailViewModel")
    }
    
    private let disposeBag = DisposeBag()
    
    private let formatter: TeamListDetailDataFormatterProtocol
    private let operationManager: TeamListOperationProtocol
    
    private var data: TeamsResponse?
    private var state: TeamListDetailStateBlock?
    
    init(formatter: TeamListDetailDataFormatterProtocol,
         operationManager: TeamListOperationProtocol) {
        self.formatter = formatter
        self.operationManager = operationManager
        subscribeOperationManagerPublisher()
    }
    
    func subscribeState(completion: @escaping TeamListDetailStateBlock) {
        state = completion
    }
    
    func getCharacterList() {
        state?(.loading)
        operationManager.getTeamListData()
    }
    
    private func dataHandler(with response: TeamsResponse) {
        data = response
        state?(.done)
    }
    
    private func subscribeOperationManagerPublisher() {
        operationManager.subscribeDataPublisher { [weak self] result in
            switch result {
            case .failure(let error):
                print("error : \(error)")
            case .success(let response):
                self?.dataHandler(with: response)
            }
        }.disposed(by: disposeBag)
    }
    
}

// MARK: - ItemListProtocol
extension TeamListDetailViewModel: ItemListProtocol {
    
    func askNumberOfSection() -> Int {
        return 1
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        guard let dataUnwrapped = data else { return 0 }
        return dataUnwrapped.results
    }
    
    func askData(at index: Int) -> GenericDataProtocol? {
        guard let dataUnwrapped = data else { return nil }
        return formatter.getItem(from: dataUnwrapped.response[index])
    }
    
}
