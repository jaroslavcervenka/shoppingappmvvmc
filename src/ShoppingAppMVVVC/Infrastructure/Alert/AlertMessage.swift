//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

struct AlertMessage: Equatable {
    static func == (lhs: AlertMessage, rhs: AlertMessage) -> Bool {
        return lhs.title == rhs.title && lhs.message == rhs.message
    }

    let title: String
    let message: String
    let buttons: [String]
    let actions: [String:() -> Void]
}