//
// Created by Jaroslavc Cervenka on 11/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import RxSwift
import OAuth2
import Alamofire

class SessionServiceImpl: SessionService {

    // MARK: - Public properties

    private(set) var sessionState: Session?

    var didSignOut: Observable<Void> {
        return self.signOutSubject.asObservable()
    }
    var didSignIn: Observable<Void> {
        return self.signInSubject.asObservable()
    }

    // MARK: - Private fields

    private let restClient: RestClient
    private let dataManager: DataManager
    private let oauth2: OAuth2PasswordGrant

    private let signOutSubject = PublishSubject<Void>()
    private let signInSubject = PublishSubject<Void>()
    private let disposeBag = DisposeBag()

    private var token: Token?
    private var sessionManager: SessionManager!

    // MARK: - Public Methods

    init(
            restClient: RestClient,
            dataManager: DataManager,
            authConfig: AuthConfig){
        self.restClient = restClient
        self.dataManager = dataManager
        self.oauth2 = OAuth2PasswordGrant(settings: [
            "client_id": authConfig.clientId,
            "client_secret": authConfig.clientSecret,
            "authorize_uri": authConfig.authorizeUri,
            "token_uri": authConfig.tokenUri,
            "redirect_uris": authConfig.redirectUri,
            "scope": authConfig.scope,
            "secret_in_body": true,
            "keychain": authConfig.useKeyChain,
        ] as OAuth2JSON)
        self.oauth2.logger = OAuth2DebugLogger(.trace)
    }

    func signIn(credentials: Credentials) -> Completable {

        /*
        // Example: use OAuth and call Online API
        var authParameters = OAuth2StringDict()
        authParameters["acr_values"] = credentials.tenant
        self.oauth2.username = credentials.username
        self.oauth2.password = credentials.password

        self.oauth2.authorize(params: authParameters) { authParameters, error in
            if let params = authParameters {
                print("Authorized! Access token is in `oauth2.accessToken`")
                print("Authorized! Additional parameters: \(params)")
                print("Authorized! Token: \(self.oauth2.accessToken)")
            } else {
                print("Authorization was canceled or went wrong: \(error)")   // error will not be nil
            }
        }

        // Example: call Online API
        let sessionManager = SessionManager()
        let retryHandler = OAuth2RetryHandler(oauth2: self.oauth2)
        sessionManager.adapter = retryHandler
        sessionManager.retrier = retryHandler
        self.sessionManager = sessionManager   // you must hold on to this somewhere

        sessionManager.request("https://api/v1/products/categories").validate().responseJSON { response in
            debugPrint(response)
        }
        */


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
