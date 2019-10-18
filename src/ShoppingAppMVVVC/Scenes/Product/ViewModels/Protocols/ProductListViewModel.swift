//
// Created by Jaroslavc Cervenka on 10/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import RxSwift

protocol ProductListViewModel {
    var title: String {get}

    var didSelectProduct: Observable<ProductModel> {get}

    func selectProduct(product: ProductModel)
}