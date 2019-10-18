//
// Created by Jaroslavc Cervenka on 05/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import XCoordinator
import Swinject

enum HomeRoute: Route {
    case productList
    case user
    case setup
    case about
}

class MainTabCoordinator: TabBarCoordinator<HomeRoute> {
    private let productRouter: StrongRouter<ProductRoute>
    private let userRouter: StrongRouter<UserRoute>
    private let settingsRouter: StrongRouter<SettingsRoute>
    private let aboutRouter: StrongRouter<AboutRoute>

    init(
            productCoordinator: ProductCoordinator,
            userCoordinator: UserCoordinator,
            settingsCoordinator: SettingsCoordinator,
            aboutCoordinator: AboutCoordinator
        ) {
        let imgProducts = UIImage(asset: Icons.cart)
        let imgUser = UIImage(asset: Icons.user)
        let imgSetup = UIImage(asset: Icons.setup)
        let imgAbout = UIImage(asset: Icons.info)

        // Products page
        productCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Products".localized, image: imgProducts, tag: 0)

        // User page
        userCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "User info".localized, image: imgUser, tag: 1)                

        // Settings page
        let tabItemSettings = UITabBarItem(title: "Settings".localized, image: imgSetup, tag: 2)
        tabItemSettings.accessibilityIdentifier = "TabItemSettings" // Use shared constant instead
        settingsCoordinator.rootViewController.tabBarItem = tabItemSettings

        // About page
        aboutCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "AboutMainButton", image: imgAbout, tag: 3)

        self.productRouter = productCoordinator.strongRouter
        self.userRouter = userCoordinator.strongRouter
        self.settingsRouter = settingsCoordinator.strongRouter
        self.aboutRouter = aboutCoordinator.strongRouter

        super.init(tabs: [productRouter, userRouter, settingsRouter, aboutRouter], select: productRouter)
    }

    // MARK: - Overrides
    override func prepareTransition(for route: HomeRoute) -> TabBarTransition {
        switch route {
        case .productList:
            return .select(productRouter)
        case .user:
            return .select(userRouter)
        case .setup:
            return .select(settingsRouter)
        case .about:
            return .select(aboutRouter)
        }
    }
}
