//
//  TeamListDetailDataFormatter.swift
//  Week_4
//
//  Created by Tahir Esirgen on 17.10.2021.
//

import Foundation

class TeamListDetailDataFormatter: TeamListDetailDataFormatterProtocol {
    
    
    func getItem(from data: ResponseData) -> ItemTableViewCellData {
        return ItemTableViewCellData(imageData: CustomImageViewComponentData(imageUrl: createImageData(by: data.venue.image ?? "")), cellInfo: LabelPackComponentData(title: data.venue.name ?? "", subTitle: getDescription(from: data.venue.address ?? "")))
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
