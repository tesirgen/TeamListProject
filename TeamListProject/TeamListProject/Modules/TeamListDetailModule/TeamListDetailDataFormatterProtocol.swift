//
//  TeamListDetailDataFormatterProtocol.swift
//  Week_4
//
//  Created by Tahir Esirgen on 17.10.2021.
//

import Foundation
protocol TeamListDetailDataFormatterProtocol {
    func getItem(from: ResponseData) -> ItemTableViewCellData
}
