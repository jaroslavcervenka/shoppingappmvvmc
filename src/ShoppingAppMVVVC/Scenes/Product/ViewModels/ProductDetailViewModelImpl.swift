//
// Created by Jaroslavc Cervenka on 10/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import XCoordinator

class ProductDetailViewModelImpl : ProductDetailViewModel{

    var title: String
    var code: String
    var brand: String
    var price: Float
    var formattedPrice: String
    var name: String
    var imageUrl: String
    var thumbnailUrl: String

    init() {
        self.title = "ProductDetail".localized
        self.code = ""
        self.brand = ""
        self.price = 0
        self.formattedPrice = "0"
        self.name = ""
        self.imageUrl = ""
        self.thumbnailUrl = ""
    }

    func load(from product: ProductModel) {

        self.code = product.code
        self.name = product.name
        self.brand = product.brand
        self.price = product.price
        self.formattedPrice =
                ProductDetailViewModelImpl.getFormattedPrice(from: product.price)
        self.imageUrl = product.imageUrl
        self.thumbnailUrl = ProductDetailViewModelImpl.getThumbnailUrl(from: product.imageUrl)
    }

    private static func getFormattedPrice(from price: Float) -> String {
        let priceText = Formatter().formatPrice(from: price as NSNumber)

        return priceText
    }

    private static func getThumbnailUrl(from imageUrl: String) -> String {
        let thumbnailUrl = UriFormatter.createImageDetailLink(from: imageUrl)

        return thumbnailUrl
    }
}
