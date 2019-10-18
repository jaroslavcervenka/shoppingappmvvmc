//
// Created by Jaroslavc Cervenka on 17/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

typealias Languages = [String:[String:String]]

struct TranslationsResponse: Codable {
    let languages: Languages
}