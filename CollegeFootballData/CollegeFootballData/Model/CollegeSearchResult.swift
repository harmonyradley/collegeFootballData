//
//  CollegeSearchResult.swift
//  CollegeFootballData
//
//  Created by Harmony Radley on 7/27/21.
//

import Foundation

// Represents the full JSON
struct SearchResults: Codable {
    let searchTerm: [CollegeSearchResult]
}

struct CollegeSearchResult: Codable {
    let definitions: [PlayerSearchResult]
}

struct PlayerSearchResult: Codable {
    // This is snake cased in the JSON, so I have to figure out how to conform to that in swift so that it will recognize this. 
    let playersearchresult: Property
}

struct Property: Codable {
    let properties: Properties
}

struct Properties: Codable {
    let name: String
    let position: String
    let team: String
}
