//
// Created by Jaroslavc Cervenka on 12/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

import Swinject

extension Container {

    func registerDependencies() {
        self.registerInfrastructure()
        self.registerNetworking()
        self.registerServices()
        self.registerCoordinators()
        self.registerViewModels()
    }
}