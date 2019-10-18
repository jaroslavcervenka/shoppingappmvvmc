//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case requestFailed(statusCode: Int?, response: Data?)
}
