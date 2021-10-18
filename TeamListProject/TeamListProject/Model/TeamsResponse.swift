//
//  TeamsResponse.swift
//  Week_4
//
//  Created by Tahir Esirgen on 15.10.2021.
//
import Foundation

// MARK: - Welcome
public struct TeamsResponse: Codable {
    let response: [ResponseData]
    let results: Int
}


// MARK: - Response
public struct ResponseData: Codable {
    let team: Team
    let venue: Venue
}

// MARK: - Team
public struct Team: Codable {
    let country: String
    let logo: String
    let name: String
}
 // MARK: - Venue
public struct Venue: Codable {
    let id: Int?
    let name, address, city: String?
    let capacity: Int?
    let image: String?
}

