//
// Created by Jaroslavc Cervenka on 05/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import XCoordinator
import Swinject
import RxSwift

enum AppRoute: Route {
    case login
    case home
}

class AppCoordinator: NavigationCoordinator<AppRoute> {

    // MARK: - Stored properties
    private let home: Presentable
    private let signInCoordinator: SignInCoordinator
    private let sessionService: SessionService
    private let disposeBag = DisposeBag()

    // MARK: - Init
    init(
            tabCoordinator: MainTabCoordinator,
            signInCoordinator: SignInCoordinator,
            sessionService: SessionService) {

        self.home = tabCoordinator
        self.signInCoordinator = signInCoordinator
        self.sessionService = sessionService
        super.init(initialRoute: .login)

        self.subscribeToSessionChanges()
    }

    // MARK: - Overrides
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {

        switch route {
            case .login:
                return .presentFullScreen(self.signInCoordinator, animation: .fade)
            case .home:
                return .presentFullScreen(self.home, animation: .fade)
            }
    }

    private func subscribeToSessionChanges() {

        self.sessionService.didSignIn
                .subscribe(onNext: { [weak self] in self?.showHome() })
                .disposed(by: self.disposeBag)

        self.sessionService.didSignOut
                .subscribe(onNext: { [weak self] in self?.showSignIn() })
                .disposed(by: self.disposeBag)
    }

    private func showHome() {

        self.trigger(.home)
    }

    private func showSignIn(){

        self.trigger(.login)
    }
}
