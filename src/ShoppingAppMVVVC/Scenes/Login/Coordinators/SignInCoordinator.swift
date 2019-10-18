//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import XCoordinator

enum SignInRoute: Route {
    case signIn
    case home
}

class SignInCoordinator: NavigationCoordinator<SignInRoute>{

    private var signInViewModel: SignInViewModel!

    init(signInViewModel: SignInViewModel) {
        self.signInViewModel = signInViewModel

        super.init(initialRoute: .signIn)
    }

    override func prepareTransition(for route: SignInRoute) -> NavigationTransition {
        switch route{

            case .signIn:
                let viewController = Storyboard.Login.instantiate(SignInViewController.self)
                viewController.bind(to: self.signInViewModel)
                return .push(viewController)

            case .home:
                let viewController = Storyboard.Home.instantiate(HomeViewController.self)
                //let viewModel = UsersViewModelImpl(router: anyRouter)
                //viewController.bind(to: viewModel)
                return .push(viewController, animation: .fade)
            }
    }
}