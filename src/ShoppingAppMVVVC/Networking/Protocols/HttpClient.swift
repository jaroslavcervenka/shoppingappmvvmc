//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

protocol HttpClient {

    func set(headers: [String:String])

    func request(resource: String, method: HttpMethod, json: Data?,
                 completion: @escaping (ApiResponse) -> Void)
}