//
//  SettingsUITests.swift
//  ShoppingAppMVVVCUITests
//
//  Created by Jaroslavc Cervenka on 02/10/2019.
//  Copyright © 2019 POC Software. All rights reserved.
//

import XCTest

class SettingsUITests: UITestCase, SettingsScreenStarting {

    func test_selectSettingsNavButton_shouldShowSettingsTable() {
        XCTAssertTrue(successfullySignedIn())
        XCTAssertTrue(startSettingsScreen())
    }
}
