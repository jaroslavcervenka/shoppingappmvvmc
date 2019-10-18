//
// Created by Jaroslavc Cervenka on 16/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    func configureDismissKeyboard() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:))))
    }

    @objc private func handleTap(sender: UITapGestureRecognizer? = nil) {
        sender?.view?.endEditing(true)
    }

    public func presentOnTop(_ viewController: UIViewController, animated: Bool) {
        var topViewController = self
        while let presentedViewController = topViewController.presentedViewController {
            topViewController = presentedViewController
        }
        topViewController.present(viewController, animated: animated)
    }

    public static var storyboardIdentifier: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
}

