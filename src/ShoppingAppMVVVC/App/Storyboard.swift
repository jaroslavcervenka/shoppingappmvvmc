//
// Created by Jaroslavc Cervenka on 24/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import UIKit

public enum Storyboard: String {
    case Home
    case Login
    case Product
    case User
    case About
    case Settings

    public func instantiate<ViewController: UIViewController>(_: ViewController.Type, inBundle bundle: Bundle = Bundle.main) -> ViewController {
        let storyboardName = self.rawValue

        guard
                let vc = UIStoryboard(name: storyboardName, bundle: bundle)
                        .instantiateViewController(withIdentifier: ViewController.storyboardIdentifier) as? ViewController
                else { fatalError("Couldn't instantiate \(ViewController.storyboardIdentifier) from \(self.rawValue)") }

        return vc
    }
}

