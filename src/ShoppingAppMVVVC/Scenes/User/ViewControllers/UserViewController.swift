//
// Created by Jaroslavc Cervenka on 06/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import SnapKit

class UserViewController:
        UIViewController,
        BindableType{

    // MARK: - Views

    @IBOutlet private var stackView: UIStackView!
    @IBOutlet private var firstNameLabelView: UIView!
    @IBOutlet private var firstNameLabel: UILabel!
    @IBOutlet private var firstNameTextView: UIView!
    @IBOutlet private var firstNameTextField: UITextField!
    @IBOutlet private var lastNameLabelView: UIView!
    @IBOutlet private var lastNameLabel: UILabel!
    @IBOutlet private var lastNameTextView: UIView!
    @IBOutlet private var lastNameTextField: UITextField!

    // MARK: - Stored properties

    var viewModel: UserViewModel!

    private let disposeBag = DisposeBag()

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
    }

    // MARK: - BindableType

    func setUpBindings() {
        guard let viewModel = self.viewModel else { return }
        configureNavBar(title: viewModel.title)

/*
        self.firstNameTextField.rx.text.orEmpty
                .bind(to: viewModel.firstName)
                .disposed(by: self.disposeBag)

        self.lastNameTextField.rx.text.orEmpty
                .bind(to: viewModel.lastName)
  
 .disposed(by: self.disposeBag)
 */
    }

    private func setUpLayout() {

        self.stackView.snp.makeConstraints { maker in
            maker.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            maker.left.equalToSuperview().offset(Constants.layout.margin)
            maker.right.equalToSuperview().offset(-1 * Constants.layout.margin)
        }

        // First name
        self.firstNameLabelView.snp.makeConstraints { maker in
            maker.height.equalTo(Constants.layout.labelHeight)
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
        }
        self.firstNameLabel.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        self.firstNameTextView.snp.makeConstraints { maker in
            maker.height.equalTo(Constants.layout.textFieldHeight)
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
        }
        self.firstNameTextField.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }

        // Last name
        self.lastNameLabelView.snp.makeConstraints { maker in
            maker.height.equalTo(Constants.layout.labelHeight)
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
        }
        self.lastNameLabel.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        self.lastNameTextView.snp.makeConstraints { maker in
            maker.height.equalTo(Constants.layout.textFieldHeight)
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
        }
        self.lastNameTextField.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }

    private func configureNavBar(title: String) {
        self.title = title
    }
}
