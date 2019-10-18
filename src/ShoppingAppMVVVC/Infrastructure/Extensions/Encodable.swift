//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

extension Encodable {
    func toJson() -> Data? {
        return try? Json.encoder.encode(self)
    }
}