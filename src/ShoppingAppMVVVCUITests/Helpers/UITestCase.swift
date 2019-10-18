//
//  UITestCase.swift
//  ShoppingAppMVVVCUITests
//
//  Created by Jaroslavc Cervenka on 02/10/2019.
//  Copyright © 2019 POC Software. All rights reserved.
//

import XCTest

class UITestCase: XCTestCase {
    override func setUp() {
        super.setUp()
        (self as? StartupConfigurable)?.configureStartup()
    }
}
