//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

struct SignInResponse: Codable {
    var accessToken: String?
    var tokenType: String?
}