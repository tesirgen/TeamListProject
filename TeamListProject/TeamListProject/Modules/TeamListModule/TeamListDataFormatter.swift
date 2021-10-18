//
//  TeamListDataFormatter.swift
//  Week_4
//
//  Created by Tahir Esirgen on 15.10.2021.
//

import Foundation

class TeamListDataFormatter: TeamListDataFormatterProtocol {
    
    
    func getItem(from data: ResponseData) -> ItemTableViewCellData {
        return ItemTableViewCellData(imageData: CustomImageViewComponentData(imageUrl: createImageData(by: data.team.logo)), cellInfo: LabelPackComponentData(title: data.team.name, subTitle: getDescription(from: data.team.country)))
    }
    
    private func getDescription(from rawValue: String?) -> String {
        guard let value = rawValue, !value.isEmpty else {
            return "UnKnown"
        }
        return value

    }
    
    private func createImageData(by value: String) -> String {
        return value
    }
    
}
