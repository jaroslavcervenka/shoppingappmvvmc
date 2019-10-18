//
// Created by Jaroslavc Cervenka on 06/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class SettingsViewController:
        UITableViewController,
        BindableType,
        Accessible {

    // MARK: - Views
    @IBOutlet weak var sendNotificationsSwitch: UISwitch!
    @IBOutlet weak var debugSwitch: UISwitch!
    @IBOutlet weak var resetSwitch: UISwitch!
    @IBOutlet weak var sendNotificationsLabel: UILabel!
    @IBOutlet weak var debugLabel: UILabel!
    
    
    // MARK: - Stored properties
    var viewModel: SettingsViewModel!

    // MARK: - Private properties
    private let disposeBag = DisposeBag()

    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - BindableType
    func setUpBindings() {
        guard let viewModel = self.viewModel else { return }
        configureNavBar(title: viewModel.title)

        viewModel.notifications
                .bind(to: self.sendNotificationsSwitch.rx.isOn)
                .disposed(by: self.disposeBag)

        viewModel.debug
                .bind(to: self.debugSwitch.rx.isOn)
                .disposed(by: self.disposeBag)

        self.sendNotificationsSwitch.rx.isOn
                .skip(1)
                .bind(to: viewModel.notifications)
                .disposed(by: self.disposeBag)

        self.debugSwitch.rx.isOn
                .skip(1)
                .bind(to: viewModel.debug)
                .disposed(by: self.disposeBag)
    }
    
    private func configureNavBar(title: String) {
        self.title = title
    }
}
