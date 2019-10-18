//
// Created by Jaroslavc Cervenka on 12/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

extension Container {

    func registerViewModels() {
        self.autoregister(SignInViewModel.self, initializer: SignInViewModel.init)
        self.autoregister(ProductListViewModel.self, initializer: ProductListViewModelImpl.init)
        self.autoregister(ProductDetailViewModel.self, initializer: ProductDetailViewModelImpl.init)
        self.autoregister(UserViewModel.self, initializer: UserViewModel.init)
        self.autoregister(SettingsViewModel.self, initializer: SettingsViewModel.init)
        self.autoregister(AboutViewModel.self, initializer: AboutViewModel.init)
    }
}
