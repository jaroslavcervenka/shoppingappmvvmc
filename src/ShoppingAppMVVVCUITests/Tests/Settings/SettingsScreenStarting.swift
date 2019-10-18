//
//  SettingsScreenStarting.swift
//  ShoppingAppMVVVCUITests
//
//  Created by Jaroslavc Cervenka on 02/10/2019.
//  Copyright © 2019 POC Software. All rights reserved.
//

import XCTest

protocol  SettingsScreenStarting: SignInScreenStarting {
    func startSettingsScreen() -> Bool
}

extension SettingsScreenStarting {
    func startSettingsScreen() -> Bool {
        let app = XCUIApplication()
        let tabItemSettings = app.tabBars.firstMatch.buttons[AccessibilityIdentifier.TabBar.tabItemSettings]

        tabItemSettings.tap()

        return viewScreenIsShowing(forTitled: "Settings")
    }
}
