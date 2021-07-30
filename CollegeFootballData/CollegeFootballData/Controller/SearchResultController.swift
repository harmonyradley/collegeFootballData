//
//  SearchResultController.swift
//  CollegeFootballData
//
//  Created by Harmony Radley on 7/27/21.
//

import Foundation

class SearchResultController {

    enum NetworkError: Error {
        case badURL
        case badData
        case noDecode
        case failedFetch
    }

    typealias CompletionHandler = (Result<Bool, NetworkError>) -> Void

    private let apiKey = "D1nfhzmjTqtT1vaooDpFb4gVuL+VFh200eJxaAJnsLtrKefEO7tXAYT4wmtmIcRQ"
    private let baseURL = URL(string: "https://api.collegefootballdata.com/player/search/")!

    var collegePlayerSearchResults: [CollegeSearchResult] = []

    func performSearch(with searchTerm: String, completion: @escaping CompletionHandler) {
        // making sure the url is formatted correctly 
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let queryParamerters = ["query": searchTerm,
                                "api_key": apiKey]
        components?.queryItems = queryParamerters.map({ URLQueryItem(name: $0.key, value: $0.value)})

        guard let requestURL = components?.url else {
            completion(.failure(.badURL))
            return
        }

        // returns downloaded data directly to the app in memory
        // GET request
        URLSession.shared.dataTask(with: requestURL) { data, response, error in
            if let response = response as? HTTPURLResponse,
               response.statusCode != 200 {
                completion(.failure(.failedFetch))
                return
            }

            if let error = error {
                NSLog("Error searching for college player with search term \(searchTerm): \(error)")
                completion(.failure(.failedFetch))
            }
            
            guard let data = data else {
                NSLog("No data returned from data task")
                completion(.failure(.badData))
                return
            }

            // Converting JSON data returned by an API into model objects
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let searchResults = try decoder.decode(SearchResults.self, from: data)
                self.collegePlayerSearchResults = searchResults.searchTerm
                DispatchQueue.main.async {
                    completion(.success(true))
                }

            } catch {
                NSLog("Error decoding CollegeSearchResult objects: \(error)")
                completion(.failure(.noDecode))
                return
            }
        }.resume() // This is what starts the data task. Without it, the data task would never go to the API.
    }
}
