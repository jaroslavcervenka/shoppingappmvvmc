//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

enum SessionEndpoints {

    class SignIn: ApiRequest<SignInResponse> {
        init(credentials: Credentials) {
            super.init(resource: "login",
                    method: .post,
                    json: SignInRequest(username: credentials.username, password: credentials.password).toJson())
        }
    }

    class SignOut: ApiRequest<VoidResponse> {
        init() {
            super.init(resource: "logout",
                    method: .post)
        }
    }

    class FetchMe: ApiRequest<MeResponse> {
        init() {
            super.init(resource: "me")
        }
    }
}
