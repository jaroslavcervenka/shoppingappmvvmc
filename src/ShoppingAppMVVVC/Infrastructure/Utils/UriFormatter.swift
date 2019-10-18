//
// Created by Jaroslavc Cervenka on 10/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

struct UriFormatter {
    private static let imageThumbnailQueryString = "w=234"
    private static let imageDetailQueryString = "w=500"

    static func createImageThumbnailLink(from: String) -> String{
        return "\(from)&\(imageThumbnailQueryString)"
    }

    static func createImageDetailLink(from: String) -> String{
        return "\(from)&\(imageDetailQueryString)"
    }
}