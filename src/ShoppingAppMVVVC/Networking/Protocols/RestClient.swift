//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import RxSwift

protocol RestClient{
    func request<T:Codable>(_ request: ApiRequest<T>) -> Single<T>
}