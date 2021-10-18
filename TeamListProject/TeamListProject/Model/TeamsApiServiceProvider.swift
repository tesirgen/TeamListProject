//
//  TeamsApiServiceProvider.swift
//  Week_4
//
//  Created by Tahir Esirgen on 15.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class TeamsApiServiceProvider: ApiServiceProvider<BaseRequest> {
    
    static let url = "https://api-football-v1.p.rapidapi.com/v3/teams?country=Turkey"
    
    init(headers:HeaderProviderProtocol) {
        super.init(method: .get, baseUrl: Self.url,headerProvider: headers)
    }
    init(headers:HeaderProviderProtocol,data: BaseRequest) {
        super.init(method: .get, baseUrl: Self.url,  data: data, headerProvider: headers)
    }
}
