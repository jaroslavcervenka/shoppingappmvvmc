//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

extension Data {
    func toObject<T:Codable>(_ type: T.Type) -> T? {
        if type == VoidResponse.self {
            return VoidResponse() as? T
        }
        return try? Json.decoder.decode(type, from: self)
    }
}