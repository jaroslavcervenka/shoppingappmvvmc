//
// Created by Jaroslavc Cervenka on 10/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

class Formatter{
    private let currencyFormatter: NumberFormatter

    init(){
        self.currencyFormatter = NumberFormatter()
        self.currencyFormatter.usesGroupingSeparator = true
        self.currencyFormatter.numberStyle = .none
        // localize to your grouping and decimal separator
        self.currencyFormatter.locale = Locale.init(identifier: "cs-cz")
    }

    func formatPrice(from: NSNumber) -> String{
        let price = self.currencyFormatter.string(from: from) ?? ""
        return "\(price) Kč"
    }
}