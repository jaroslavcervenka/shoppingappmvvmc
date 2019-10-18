//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

struct Session: Codable, Equatable {
    private(set) var token: Token
    private(set) var email: String
    private(set) var profile: MeResponse

    mutating func updateDetails(_ data: MeResponse) {
        self.profile = data
    }
}