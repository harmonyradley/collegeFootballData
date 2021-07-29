//
//  CollegeFootballDataTests.swift
//  CollegeFootballDataTests
//
//  Created by Harmony Radley on 7/27/21.
//

import XCTest
@testable import CollegeFootballData

class CollegeFootballDataTests: XCTestCase {

    let timeout: TimeInterval = 5

    func testServerResponse() {
        let url = URL(string: "https://api.collegefootballdata.com/player/search/D1nfhzmjTqtT1vaooDpFb4gVuL+VFh200eJxaAJnsLtrKefEO7tXAYT4wmtmIcRQ")!
        let expectation = self.expectation(description: "Server responds in reasonable time")
        URLSession.shared.dataTask(with: url) { data, response, error in
            defer { expectation.fulfill() }
            XCTAssertNotNil(data)
            XCTAssertNotNil(response)
            XCTAssertNil(error)
        }.resume()
        wait(for: [expectation], timeout: timeout)
    }

//    func testFetchPerformSearch() throws {
//        let expectation1 = self.expectation(description: "You can perform a Search!")
//        try SearchResultController.performSearch(UISearchBar.searchterm)
//        expectation1.fulfill()
//        wait(for: [expectation1], timeout: timeout)
//    }

}
