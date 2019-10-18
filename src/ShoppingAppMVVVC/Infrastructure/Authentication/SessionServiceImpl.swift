//
// Created by Jaroslavc Cervenka on 11/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import RxSwift

class SessionServiceImpl: SessionService {

    // MARK: - Private fields
    private let restClient: RestClient
    private let dataManager: DataManager

    private let signOutSubject = PublishSubject<Void>()
    private let signInSubject = PublishSubject<Void>()
    private let disposeBag = DisposeBag()

    private var token: Token?

    // MARK: - Public properties

    private(set) var sessionState: Session?

    var didSignOut: Observable<Void> {
        return self.signOutSubject.asObservable()
    }
    var didSignIn: Observable<Void> {
        return self.signInSubject.asObservable()
    }

    // MARK: - Public Methods

    init(
            restClient: RestClient,
            dataManager: DataManager){
        self.restClient = restClient
        self.dataManager = dataManager
    }

    func signIn(credentials: Credentials) -> Completable {
        let signIn = self.restClient.request(SessionEndpoints.SignIn(credentials: credentials))
        let fetchMe = self.restClient.request(SessionEndpoints.FetchMe())
        
        return signIn
            .do(onSuccess: { [weak self] in try self?.setToken(response: $0) })
            .flatMap { _ in fetchMe }
            .do(onSuccess: { [weak self] in try self?.setSession(credentials: credentials, response: $0) })
            .asCompletable()
    }

    private func setToken(response: SignInResponse) throws {
        guard let accessToken = response.accessToken, let tokenType = response.tokenType else {
            throw SessionError.invalidToken
        }

        self.token = Token(token: accessToken, tokenType: tokenType)
    }

    private func setSession(credentials: Credentials, response: MeResponse) throws {
        guard let token = self.token else {
            throw SessionError.invalidToken
        }

        self.sessionState = Session(
                token: token,
                email: credentials.username.lowercased(),
                profile: response)
        self.dataManager.set(key: SettingKey.session, value: self.sessionState)

        self.signInSubject.onNext(Void())
    }
}
