//
// Created by Jaroslavc Cervenka on 02/10/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import UIKit

protocol Accessible {
    func generateAccessibilityIdentifiers()
}

extension Accessible {

    func generateAccessibilityIdentifiers() {
        #if DEBUG
        let mirror = Mirror(reflecting: self)

        for child in mirror.children {
            if
                    let view = child.value as? UIView,
                    let identifier = child.label?.replacingOccurrences(of: ".storage", with: "") {

                view.accessibilityIdentifier = "\(type(of: self)).\(identifier)"
            }
        }
        #endif
    }
}
