//
//  CollegeFootballDataUITests.swift
//  CollegeFootballDataUITests
//
//  Created by Harmony Radley on 7/27/21.
//

import XCTest

class CollegeFootballDataUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        app.launchArguments = ["UITesting"]
        app.launch()
    }
}
