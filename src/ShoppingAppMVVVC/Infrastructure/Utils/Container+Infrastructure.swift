//
// Created by Jaroslavc Cervenka on 16/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Swinject

extension Container {

    func registerInfrastructure() {
        self.autoregister(TranslationsService.self, initializer: TranslationsServiceImpl.init).inObjectScope(.container)
        self.autoregister(SessionService.self, initializer: SessionServiceImpl.init).inObjectScope(.container)
        self.autoregister(DataManager.self, initializer: UserDataManager.init).inObjectScope(.container)
        self.autoregister(AlertDispatcher.self, initializer: AlertDispatcherImpl.init).inObjectScope(.container)

        //configuration
        self.autoregister(AppConfig.self, initializer: AppConfig.init).inObjectScope(.container)
        self.autoregister(AuthConfig.self, initializer: AuthConfig.init).inObjectScope(.container)

        //avoid circular dependency
        self.register(TokenService.self) { _ in TokenServiceImpl() }
                .initCompleted { container, tokenServiceInstance in
                    let tokenService = tokenServiceInstance as! TokenServiceImpl
                    tokenService.sessionService = container.resolve(SessionService.self)
                }.inObjectScope(.container)

    }
}

