//
// Created by Jaroslavc Cervenka on 06/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import XCoordinator

enum UserRoute: Route {
    case userinfo
    case home
}

class UserCoordinator: NavigationCoordinator<UserRoute>{
    private var userViewModel: UserViewModel!

    init(userViewModel: UserViewModel
    ) {
        self.userViewModel = userViewModel
        
        super.init(initialRoute: .userinfo)
    }

    override func prepareTransition(for route: UserRoute) -> NavigationTransition {
        switch route{
            case .userinfo:
                let viewController = Storyboard.User.instantiate(UserViewController.self)
                viewController.bind(to: self.userViewModel)
                return .push(viewController, animation: .fade)

            case .home:
                let viewController = Storyboard.Home.instantiate(HomeViewController.self)
                return .push(viewController, animation: .fade)
            }
    }
}
