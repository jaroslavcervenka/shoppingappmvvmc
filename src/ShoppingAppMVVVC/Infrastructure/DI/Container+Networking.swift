//
// Created by Jaroslavc Cervenka on 16/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Swinject

extension Container {

    func registerNetworking() {
        self.autoregister(RestClient.self, initializer: ApiRestClient.init).inObjectScope(.container)
        self.autoregister(HttpClient.self, initializer: HttpClientMock.init).inObjectScope(.container)
    }
}
