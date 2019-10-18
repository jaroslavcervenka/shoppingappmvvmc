//
// Created by Jaroslavc Cervenka on 30/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

// Authentication configuration
struct AuthConfig {
    var clientId: String = "UserAuthenticationTest"
    var clientSecret: String = "client-secret"
    var authorizeUri: String = "https://identity/connect/authorize"
    var tokenUri: String = "https://identity/connect/token"
    var redirectUri: [String] = ["com.poc.shoppingpoc://oauth/callback"]
    var scope: [String] = ["all"]
    var useKeyChain: Bool = true
}