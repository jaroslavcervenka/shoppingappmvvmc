//
// Created by Jaroslavc Cervenka on 05/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import XCoordinator

enum AboutRoute: Route {
    case about
    case home
}

class AboutCoordinator : NavigationCoordinator<AboutRoute>{
    private let aboutViewModel: AboutViewModel

    init(aboutViewModel: AboutViewModel) {
        self.aboutViewModel = aboutViewModel

        super.init(initialRoute: .about)
    }

    override func prepareTransition(for route: AboutRoute) -> NavigationTransition{
        switch route{
        case .about:
            let viewController = Storyboard.About.instantiate(AboutViewController.self)
            viewController.bind(to: aboutViewModel)
            return .push(viewController, animation: .fade)
        case .home:
            let viewController = Storyboard.Home.instantiate(HomeViewController.self)
            //let viewModel = UsersViewModelImpl(router: anyRouter)
            //viewController.bind(to: viewModel)
            return .push(viewController, animation: .fade)
        }
    }
}