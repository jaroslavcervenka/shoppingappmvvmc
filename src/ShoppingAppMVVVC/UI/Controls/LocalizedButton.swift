//
// Created by Jaroslavc Cervenka on 17/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import UIKit

class LocalizedButton: UIButton {
    @IBInspectable var localizationKey: String?
    @IBInspectable var upperText: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()

        if self.localizationKey == nil {
            assertionFailure("Translation key not set for \(self.title(for: .normal) ?? "")")
        }
        self.setTitle(self.upperText ? self.localizationKey?.localizedUpper : self.localizationKey?.localized)
    }

    private func setTitle(_ title: String?) {
        UIView.performWithoutAnimation {
            self.setTitle(title, for: .normal)
            self.layoutIfNeeded()
        }
    }
}


