//
// Created by Jaroslavc Cervenka on 10/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import XCoordinator
import RxSwift

class ProductListViewModelImpl: ProductListViewModel{

    // MARK: - Public properties
    var title: String
    var didSelectProduct: Observable<ProductModel> {
        return self.selectProductSubject.asObservable()
    }

    // MARK: - Private fields
    private let selectProductSubject = PublishSubject<ProductModel>()
    private let disposeBag = DisposeBag()

    // MARK: - Public Methods
    init() {
        self.title = "Products".localized
    }

    func selectProduct(product: ProductModel) {
        self.selectProductSubject.onNext(product)
    }
}