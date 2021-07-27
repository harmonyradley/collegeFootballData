//
//  SearchResultController.swift
//  CollegeFootballData
//
//  Created by Harmony Radley on 7/27/21.
//

import Foundation

class SearchResultController {

    enum HTTPMethod: String {
        case get = "GET"
    }

    private let baseURL = URL(string: "api.collegefootballdata.com/player/search")!
    private var task: URLSessionTask?

    func performSearch(searchTerm: String, completion: @escaping (Error?) -> Void) {
        task?.cancel()

        // create request
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)




    }








}
