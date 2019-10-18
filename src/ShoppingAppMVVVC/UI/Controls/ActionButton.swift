//
// Created by Jaroslavc Cervenka on 17/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import UIKit

class ActionButton: LocalizedButton {
    open internal(set) override var isEnabled: Bool {
        didSet {
            self.backgroundColor = self.isEnabled ?
                    UIColor(named: .colorButtonBackground) : UIColor(named: .colorButtonBackgroundDisabled)
        }
    }
}