//
//  ViewScreenVerifying.swift
//  ShoppingAppMVVVCUITests
//
//  Created by Jaroslavc Cervenka on 02/10/2019.
//  Copyright © 2019 POC Software. All rights reserved.
//

import XCTest

protocol ViewScreenVerifying {
    func viewScreenIsShowing(forTitled: String) -> Bool
}

extension ViewScreenVerifying {
    func viewScreenIsShowing(forTitled title: String) -> Bool {
        let app = XCUIApplication()
        let titleLabel = app.staticTexts[title]

        return titleLabel.exists
    }
}
