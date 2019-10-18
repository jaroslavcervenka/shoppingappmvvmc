//
// Created by Jaroslavc Cervenka on 16/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import RxSwift

enum SessionError: Error {
    case invalidToken
}

protocol SessionService {

    var didSignOut: Observable<Void> {get}

    var didSignIn: Observable<Void> {get}

    var sessionState: Session? {get}

    func signIn(credentials: Credentials) -> Completable
}