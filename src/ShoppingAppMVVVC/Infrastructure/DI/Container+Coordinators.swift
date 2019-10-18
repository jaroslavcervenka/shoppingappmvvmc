//
// Created by Jaroslavc Cervenka on 12/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Swinject

extension Container {

    func registerCoordinators() {
        self.autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
        self.autoregister(SignInCoordinator.self, initializer: SignInCoordinator.init)
        self.autoregister(MainTabCoordinator.self, initializer: MainTabCoordinator.init)
        self.autoregister(ProductCoordinator.self, initializer: ProductCoordinator.init)
        self.autoregister(SettingsCoordinator.self, initializer: SettingsCoordinator.init)
        self.autoregister(UserCoordinator.self, initializer: UserCoordinator.init)
        self.autoregister(AboutCoordinator.self, initializer: AboutCoordinator.init)
    }
}
