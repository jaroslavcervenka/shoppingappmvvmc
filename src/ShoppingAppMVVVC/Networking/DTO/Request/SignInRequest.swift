//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

struct SignInRequest: Codable {
    let username: String
    let password: String
}