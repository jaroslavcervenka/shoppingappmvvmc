//
// Created by Jaroslavc Cervenka on 05/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import XCoordinator
import RxSwift

enum ProductRoute: Route {
    case productList
    case productDetail(ProductModel)
}

class ProductCoordinator: NavigationCoordinator<ProductRoute>{

    // MARK: - Stored properties
    private let productListViewModel: ProductListViewModel!
    private let productDetailViewModel: ProductDetailViewModel!
    private let disposeBag = DisposeBag()

    // MARK: - Init
    init(
            productListViewModel: ProductListViewModel,
            productDetailViewModel: ProductDetailViewModel) {

        self.productListViewModel = productListViewModel
        self.productDetailViewModel = productDetailViewModel

        super.init(initialRoute: .productList)
        self.subscribeEvents()
    }

    override func prepareTransition(for route: ProductRoute) -> NavigationTransition {

        switch route{
        case .productList:
            let viewController = Storyboard.Product.instantiate(ProductListViewController.self)
            viewController.bind(to: self.productListViewModel)
            return .push(viewController, animation: .fade)

        case .productDetail(let product):
            let viewController = Storyboard.Product.instantiate(ProductDetailViewController.self)
            self.productDetailViewModel.load(from: product)
            viewController.bind(to: self.productDetailViewModel)
            return .push(viewController, animation: .navigation)
        }
    }

    private func subscribeEvents() {

        self.productListViewModel.didSelectProduct
                .subscribe(onNext: { [weak self] in self?.showProductDetail(product: $0) })
                .disposed(by: self.disposeBag)
    }

    private func showProductDetail(product: ProductModel){

        self.trigger(.productDetail(product))
    }
}