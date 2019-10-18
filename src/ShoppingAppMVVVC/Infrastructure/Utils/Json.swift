//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

enum Json {
    static let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()

    static let decoder = JSONDecoder()
}