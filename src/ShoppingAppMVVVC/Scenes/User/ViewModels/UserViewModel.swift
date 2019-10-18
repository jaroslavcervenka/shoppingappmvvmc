//
// Created by Jaroslavc Cervenka on 23/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import RxSwift

class UserViewModel {
    let title = "UserInfo".localized
    let firstName = BehaviorSubject(value: "")
    let lastName = BehaviorSubject(value: "")
}