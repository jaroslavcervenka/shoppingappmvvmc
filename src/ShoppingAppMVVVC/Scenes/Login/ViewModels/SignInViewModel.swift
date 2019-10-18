import RxSwift

class SignInViewModel {
    private let sessionService: SessionService
    private let disposeBag = DisposeBag()

    let title = "SignIn".localized
    let username = BehaviorSubject<String>(value: "")
    let password = BehaviorSubject<String>(value: "")
    let isSignInActive = BehaviorSubject<Bool>(value: false)
    let isLoading = BehaviorSubject<Bool>(value: false)

    init(sessionService: SessionService) {
        self.sessionService = sessionService
        self.setUpBindings()
    }

    func signIn() {
        self.isLoading.onNext(true)

        Observable
                .combineLatest(self.username, self.password, self.isSignInActive)
                .take(1)
                .filter { _, _, active in active }
                .map { username, password,  _ in Credentials(username: username, password: password) }
                .flatMapLatest { [weak self] in self?.sessionService.signIn(credentials: $0) ?? Completable.empty() }
                .subscribe { [weak self] _ in self?.isLoading.onNext(false) }
                .disposed(by: self.disposeBag)
    }

    private func setUpBindings() {
        Observable
                .combineLatest(self.username, self.password)
                .map{ $0.hasNonEmptyValue() && $1.hasNonEmptyValue() }
                .bind(to: self.isSignInActive)
                .disposed(by: self.disposeBag)
    }
}
