//
// Created by Jaroslavc Cervenka on 16/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

protocol TokenService {
    var sessionService: SessionService? {get set}

    func getToken() -> String?
}