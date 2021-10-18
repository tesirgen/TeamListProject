//
//  TeamListDataFormatterProtocol.swift
//  Week_4
//
//  Created by Tahir Esirgen on 15.10.2021.
//

import Foundation
protocol TeamListDataFormatterProtocol {
    func getItem(from: ResponseData) -> ItemTableViewCellData
}
