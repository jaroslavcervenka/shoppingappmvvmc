//
// Created by Jaroslavc Cervenka on 05/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit

class AboutViewController :
        UIViewController,
        BindableType,
        Accessible {

    // MARK: - Views

    @IBOutlet weak var mainview: UIView!
    @IBOutlet weak var textView: UITextView!

    // MARK: - Stored properties

    var viewModel: AboutViewModel!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
    }


    // MARK: - BindableType

    func setUpBindings() {
        guard let viewModel = self.viewModel else {
            return
        }
        configureNavBar(title: viewModel.title)
        self.textView.text = viewModel.aboutText
    }

    private func configureNavBar(title: String) {
        self.title = title
    }

    private func setUpLayout() {
        self.mainview.alignToSafeArea(to: self.view)

        self.textView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }

    }
}
