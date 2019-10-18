//
// Created by Jaroslavc Cervenka on 12/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

extension Container {

    func registerServices() {
        self.autoregister(ProductService.self, initializer: ProductServiceMock.init).inObjectScope(.container)
    }
}
