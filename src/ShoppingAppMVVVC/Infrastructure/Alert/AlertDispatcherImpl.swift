//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import UIKit

class AlertDispatcherImpl: AlertDispatcher {

    private var lastError: AlertMessage?

    func dispatch(error: AlertMessage) {
        guard self.lastError != error else { return }
        self.lastError = error

        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
            self.showAlert(on: viewController, error: error)
        }
    }

    private func showAlert(on viewController: UIViewController, error: AlertMessage) {

        let alert = UIAlertController(title: error.title.localized, message: error.message.localized, preferredStyle: .alert)

        for button in error.buttons {
            let alertAction = UIAlertAction(title: button.localized, style: .default) { _ in
                error.actions[button]?()
                self.lastError = nil
            }

            alert.addAction(alertAction)
        }
        viewController.presentOnTop(alert, animated: true)
    }
}