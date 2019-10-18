//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

struct Token: Codable, Equatable {
    let token: String
    let tokenType: String

    func getToken() -> String {
        return "\(tokenType) \(token)"
    }
}