//
//  CollegeSearchResult.swift
//  CollegeFootballData
//
//  Created by Harmony Radley on 7/27/21.
//

import Foundation

struct CollegeSearchResult: Codable {
    let definitions: [PlayerSearchResult]
}

struct SearchResults: Codable {
    let searchTerm: [CollegeSearchResult]
}

struct PlayerSearchResult: Codable {
    let properties: Properties
}

struct Properties: Codable {
    let name: String
    let position: String
    let team: String
}
