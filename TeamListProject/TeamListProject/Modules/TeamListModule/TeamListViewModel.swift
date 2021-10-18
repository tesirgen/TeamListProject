//
//  TeamListViewModel.swift
//  Week_4
//
//  Created by Tahir Esirgen on 15.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage
import RxSwift

class TeamListViewModel {
    
    deinit {
        print("DEINIT TeamListViewModel")
    }
    
    private let disposeBag = DisposeBag()
    
    private let formatter: TeamListDataFormatterProtocol
    private let operationManager: TeamListOperationProtocol
    
    private var data: TeamsResponse?
    private var state: TeamListStateBlock?
    
    init(formatter: TeamListDataFormatterProtocol,
         operationManager: TeamListOperationProtocol) {
        self.formatter = formatter
        self.operationManager = operationManager
        subscribeOperationManagerPublisher()
    }
    
    func subscribeState(completion: @escaping TeamListStateBlock) {
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
extension TeamListViewModel: ItemListProtocol {
    
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

