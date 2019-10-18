//
// Created by Jaroslavc Cervenka on 06/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import XCoordinator

enum SettingsRoute: Route {
    case setup
    case home
}

class SettingsCoordinator: NavigationCoordinator<SettingsRoute>{
    private let settingsViewModel: SettingsViewModel!

    init(settingsViewModel: SettingsViewModel) {
        self.settingsViewModel = settingsViewModel

        super.init(initialRoute: .setup)
    }

    override func prepareTransition(for route: SettingsRoute) -> NavigationTransition {
        switch route{
        case .setup:
            let viewController = Storyboard.Settings.instantiate(SettingsViewController.self)
            viewController.bind(to: self.settingsViewModel)
            return .push(viewController, animation: .fade)
        case .home:
            let viewController = Storyboard.Home.instantiate(HomeViewController.self)

            return .push(viewController, animation: .fade)
        }
    }
}
