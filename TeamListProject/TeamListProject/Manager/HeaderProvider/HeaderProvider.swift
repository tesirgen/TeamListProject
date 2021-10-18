//
//  HeaderProvider.swift
//  Week_4
//
//  Created by Tahir Esirgen on 15.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class HeaderProvider: HeaderProviderProtocol {
    
    func getHeaders() -> HTTPHeaders {
        var headers = HTTPHeaders()
        headers.add(HTTPHeader(name: "x-rapidapi-host", value: "api-football-v1.p.rapidapi.com"))
        headers.add(HTTPHeader(name: "x-rapidapi-key", value: "ab6ffac239msh45cfae4d07ed4c9p1f9227jsne847fd681516"))
        headers.add(HTTPHeader(name: "Content-Type", value: "application/json"))
        return headers
    }
    
}
