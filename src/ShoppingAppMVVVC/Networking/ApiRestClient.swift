//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import RxSwift

class ApiRestClient: RestClient {

    private let httpClient: HttpClient
    private let alertDispatcher: AlertDispatcher
    //private let tokenService: TokenService

    private var token: String? {
        //return self.tokenService.getToken()
        return ""
    }

    init(
            httpClient: HttpClient,
            alertDispatcher: AlertDispatcher
            //tokenService: TokenService
            ) {

        self.httpClient = httpClient
        self.alertDispatcher = alertDispatcher
        //self.tokenService = tokenService
    }

    func request<T:Codable>(_ request: ApiRequest<T>) -> Single<T>{

        return Single.create { single in
            self.httpClient.set(headers: self.getHeaders())
            self.httpClient.request(
                    resource: request.resource,
                    method: request.method,
                    json: request.json)
            {
                self.validate(response: $0, for: request, single: single)
            }

            return Disposables.create()
        }
    }

    private func validate<T:Codable>(response: ApiResponse, for request: ApiRequest<T>, single: Single<T>.SingleObserver) {
        guard response.success && response.statusCode == request.expectedCode else {
            log.error("Unsuccessful request", context: response.error)
            let error = ApiError.requestFailed(statusCode: response.statusCode, response: response.data)
            self.dispatch(error: error)
            single(.error(error))
            return
        }

        guard let parsedResponse = response.data?.toObject(T.self) else {
            log.error("Could not parse response")
            let error = ApiError.requestFailed(statusCode: response.statusCode, response: response.data)
            self.dispatch(error: error)
            single(.error(error))
            return
        }

        single(.success(parsedResponse))
    }

    private func getHeaders() -> [String:String] {
        var headers = ["Content-Type": "application/json"]
        if let tokenHeader = self.token {
            headers["Authorization"] = tokenHeader
        }
        return headers
    }

    private func dispatch(error: ApiError) {
        let message = self.getMessage(error: error)
        self.alertDispatcher.dispatch(error: message)
    }

    private func getMessage(error: ApiError) -> AlertMessage {
        var message = "Could not process request."

        if case .requestFailed(_, let response) = error,
           let errorResponse = response?.toObject(ErrorResponse.self)?.errorCode?.localized {
            message = errorResponse
        }

        let alertMessage = AlertMessage(title: "Error", message: message, buttons: ["OK"], actions: [:])
        return alertMessage
    }
}

