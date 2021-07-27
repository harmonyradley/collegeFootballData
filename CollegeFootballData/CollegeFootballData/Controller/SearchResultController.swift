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

    enum NetworkError: Error {
        case badURL
        case badData
        case noDecode
        case failedFetch
    }

    private let apiKey = "D1nfhzmjTqtT1vaooDpFb4gVuL+VFh200eJxaAJnsLtrKefEO7tXAYT4wmtmIcRQ"
    private let baseURL = URL(string: "api.collegefootballdata.com/player/search")!
    var collegePlayerSearchResults: [CollegeSearchResult] = []

    func performSearch(searchTerm: String, completion: @escaping (Result<CollegeSearchResult, NetworkError>) -> Void) {

        // create request
        var request = URLRequest(url: baseURL)
        request.httpMethod = HTTPMethod.get.rawValue

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse,
               response.statusCode != 200 {
                completion(.failure(.failedFetch))
                return
            }

            if let error = error {
                NSLog("Error getting request \(error)")
                completion(.failure(.failedFetch))
            }

            guard let data = data else {
                completion(.failure(.badData))
                return
            }

            let decoder = JSONDecoder()
            do {
                let collegeSearchResult = try decoder.decode(CollegeSearchResult.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(collegeSearchResult))
                }
            } catch {
                print("Error decoding CollegeSearchResult objects: \(error)")
                completion(.failure(.noDecode))
                return
            }
        }.resume()
    }
}
