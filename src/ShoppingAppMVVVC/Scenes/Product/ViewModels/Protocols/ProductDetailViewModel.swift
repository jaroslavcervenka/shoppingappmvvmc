//
// Created by Jaroslavc Cervenka on 10/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

protocol ProductDetailViewModel{
    var title: String {get set}
    var code: String {get set}
    var brand: String {get set}
    var price: Float {get set}
    var formattedPrice: String {get}
    var name: String {get set}
    var imageUrl: String {get set}
    var thumbnailUrl: String {get}

    func load(from: ProductModel)
}