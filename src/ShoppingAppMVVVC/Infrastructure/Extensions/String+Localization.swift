//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation


extension String {
    var localized: String {
        return LocalizationUtils.localize(key: self)
    }

    var localizedUpper: String {
        return LocalizationUtils.localize(key: self).uppercased()
    }
}
