//
// Created by Jaroslavc Cervenka on 05/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import UIKit

extension CGAffineTransform {
    mutating func rotate(by rotationAngle: CGFloat) {
        self = self.rotated(by: rotationAngle)
    }

    mutating func scale(by scalingFactor: CGFloat) {
        self = self.scaledBy(x: scalingFactor, y: scalingFactor)
    }
}
