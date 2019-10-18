//
//  SignInScreenStarting.swift
//  ShoppingAppMVVVCUITests
//
//  Created by Jaroslavc Cervenka on 02/10/2019.
//  Copyright © 2019 POC Software. All rights reserved.
//

import XCTest

protocol SignInScreenStarting: ViewScreenStarting {
    func viewSignInIsShowing() -> Bool

    func successfullySignedIn() -> Bool

    func showedAlertWhenWrongCredentials() -> Bool
}

extension SignInScreenStarting {
    func viewSignInIsShowing() -> Bool {
        return viewScreenIsShowing(forTitled: "Sign In")
    }
    
    func successfullySignedIn() -> Bool {
        let app = XCUIApplication()
        let userName = "1"
        let password = "pass"
        let navigationBar = app.navigationBars[AccessibilityIdentifier.NavigationBar.navigationProducts]

        signIn(userName: userName, password: password)
        navigationBar.waitForExistence(timeout: 10)
        return navigationBar.exists
    }

    func showedAlertWhenWrongCredentials() -> Bool {
        let app = XCUIApplication()
        let userName = "1"
        let password = "1"
        let expectedErrorText = "Username or password is incorrect. Try this password: pass"
        let alertWindow = app.alerts[AccessibilityIdentifier.Alert.Error]
        let alertText = app.staticTexts[expectedErrorText]

        signIn(userName: userName, password: password)
        alertWindow.waitForExistence(timeout: 10)

        return alertWindow.exists && alertText.exists
    }

    private func signIn(userName: String, password: String){
        let app = XCUIApplication()
        let userNameTextField = app.textFields[AccessibilityIdentifier.SignInViewController.usernameTextField]
        let passwordTextField = app.secureTextFields[AccessibilityIdentifier.SignInViewController.passwordTextField]
        let signInButton = app.buttons[AccessibilityIdentifier.SignInViewController.signInButton]

        userNameTextField.tap()
        userNameTextField.typeText(userName)
        passwordTextField.tap()
        passwordTextField.typeText(password)
        signInButton.tap()
    }
}
