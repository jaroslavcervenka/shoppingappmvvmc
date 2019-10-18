//
//  SignInUITests.swift
//  ShoppingAppMVVVCUITests
//
//  Created by Jaroslavc Cervenka on 05/09/2019.
//  Copyright © 2019 POC Software. All rights reserved.
//

import UIKit
import XCTest

class SignInUITests: UITestCase, SignInScreenStarting {

    func test_signInWithCredential_shouldShowProductsView() {

        XCTAssertTrue(viewSignInIsShowing())
        XCTAssertTrue(successfullySignedIn())
    }

    func test_signInWithWrongCredential_shouldShowAlert() {
        XCTAssertTrue(viewSignInIsShowing())
        XCTAssertTrue(showedAlertWhenWrongCredentials())
    }
}
