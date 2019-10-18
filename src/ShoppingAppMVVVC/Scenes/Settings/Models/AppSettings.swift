//
// Created by Jaroslavc Cervenka on 18/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

struct AppSettings: Codable {
    let notifications: Bool
    let debug: Bool

    static func withDefaultValues() -> AppSettings {

        return AppSettings(
                notifications: true,
                debug: false)
    }
}