//
// Created by Jaroslavc Cervenka on 26/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension UIView {

    // Creates constraints by safe area layout guide with margins
    public func alignToSafeArea(to superView: UIView) {
        self.snp.makeConstraints { maker in
            maker.top.equalTo(superView.safeAreaLayoutGuide).offset(Constants.layout.margin)
            maker.left.equalTo(superView.safeAreaLayoutGuide).offset(Constants.layout.margin)
            maker.right.equalTo(superView.safeAreaLayoutGuide).offset(-1 * Constants.layout.margin)
            maker.bottom.equalTo(superView.safeAreaLayoutGuide).offset(-1 * Constants.layout.margin)
        }
    }
}