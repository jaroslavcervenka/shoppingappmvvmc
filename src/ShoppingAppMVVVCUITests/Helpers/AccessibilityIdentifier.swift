//
//  AccessibilityIdentifier.swift
//  ShoppingAppMVVVCUITests
//
//  Created by Jaroslavc Cervenka on 02/10/2019.
//  Copyright © 2019 POC Software. All rights reserved.
//

import Foundation

public enum AccessibilityIdentifier {
    public enum NavigationBar {
        public static let navigationProducts = "Products"
        public static let navigationSettings = "Settings"
    }

    public enum TabBar {
        public static let tabItemSettings = "TabItemSettings"
    }

    public enum Alert {
        public static let Error = "Error"
    }

    public enum SignInViewController {
        public static let usernameTextField = "SignInViewController.usernameTextField"
        public static let passwordTextField = "SignInViewController.passwordTextField"
        public static let signInButton = "SignInViewController.signInButton"
    }
}
