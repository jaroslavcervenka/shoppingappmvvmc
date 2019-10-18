//
// Created by Jaroslavc Cervenka on 16/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

protocol AlertDispatcher {
    func dispatch(error: AlertMessage)
}