//
//  ViewScreenStarting.swift
//  ShoppingAppMVVVCUITests
//
//  Created by Jaroslavc Cervenka on 02/10/2019.
//  Copyright © 2019 POC Software. All rights reserved.
//

import XCTest

protocol ViewScreenStarting: StartupConfigurable, ViewScreenVerifying {
    func startViewScreen()
}

extension ViewScreenStarting {
    func startViewScreen() {
        let app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        app.launch()
    }

    func configureStartup() {
        startViewScreen()
    }
}
