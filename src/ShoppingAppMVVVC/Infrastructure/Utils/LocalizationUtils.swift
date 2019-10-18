//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

enum LocalizationUtils {

    private static var translationsService = AppDelegate.container.resolve(TranslationsService.self)!

    static var currentLocale: Locale {
        return translationsService.currentLocale
    }

    static func localize(key: String) -> String {
        return translationsService.getCurrentTranslations()?[key] ?? key
    }
}
