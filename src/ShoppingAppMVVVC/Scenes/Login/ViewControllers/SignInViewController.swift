//
// Created by Jaroslavc Cervenka on 05/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class SignInViewController:
        UIViewController,
        BindableType,
        Accessible {

    // MARK: - Views
    @IBOutlet private var usernameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var signInButton: ButtonWithProgress!

    // MARK: - Stored properties
    var viewModel: SignInViewModel!
    private let disposeBag = DisposeBag()

    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        generateAccessibilityIdentifiers()
    }

    // MARK: - BindableType
    func setUpBindings() {
        guard let viewModel = self.viewModel else { return }

        configureNavBar(title: viewModel.title)

        Observable.of(self.usernameTextField, self.passwordTextField)
                .flatMap { $0.rx.controlEvent(.editingDidEndOnExit) }
                .withLatestFrom(viewModel.isSignInActive)
                .filter { $0 }
                .bind { [weak self] _ in self?.viewModel?.signIn() }
                .disposed(by: self.disposeBag)

        self.usernameTextField.rx.text.orEmpty
                .bind(to: viewModel.username)
                .disposed(by: self.disposeBag)

        self.passwordTextField.rx.text.orEmpty
                .bind(to: viewModel.password)
                .disposed(by: self.disposeBag)

        self.signInButton.rx.tap
                .bind { [weak self] in self?.viewModel?.signIn() }
                .disposed(by: self.disposeBag)

        viewModel.isSignInActive
                .bind(to: self.signInButton.rx.isEnabled)
                .disposed(by: self.disposeBag)

        viewModel.isLoading
                .bind { [weak self] in
                    guard let `self` = self else { return }
                    self.usernameTextField.isEnabled = !$0
                    self.passwordTextField.isEnabled = !$0
                    self.signInButton.isInProgress = $0
                }
                .disposed(by: self.disposeBag)
    }

    private func configureNavBar(title: String) {
        self.title = title
    }
}
