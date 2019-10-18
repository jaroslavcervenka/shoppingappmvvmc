//
// Created by Jaroslavc Cervenka on 16/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

class TokenServiceImpl: TokenService {

    var sessionService: SessionService?

    func getToken() -> String? {
        return self.sessionService?.sessionState?.token.getToken()
    }
}