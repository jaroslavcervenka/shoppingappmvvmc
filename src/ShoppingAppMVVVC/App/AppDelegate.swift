//
//  AppDelegate.swift
//  ShoppingAppMVVVC
//
//  Created by Jaroslavc Cervenka on 05/09/2019.
//  Copyright © 2019 POC Software. All rights reserved.
//

import UIKit
import XCoordinator
import Swinject
import SwiftyBeaver

let log = SwiftyBeaver.self

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static let container = Swinject.Container()

    private var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        #if DEBUG
        // Short-circuit starting app if running unit tests
        let isUnitTesting = ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
        guard !isUnitTesting else {
            return true
        }

        if CommandLine.arguments.contains("--uitesting") { 
            configureTestingState()
        }
        #endif

        AppDelegate.configureLogger()
        AppDelegate.configureContainer()
        setup()

        return true
    }

    private func setup() {
        self.appCoordinator = AppDelegate.container.resolve(AppCoordinator.self)!
        let router = self.appCoordinator.strongRouter
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        router.setRoot(for: window)
    }

    private func configureTestingState() {
        //configure state for UI testing
    }
}
