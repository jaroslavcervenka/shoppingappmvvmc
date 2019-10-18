//
// Created by Jaroslavc Cervenka on 16/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import RxSwift

class TranslationsServiceImpl: TranslationsService {
    private let dataManager: DataManager
    private let restClient: RestClient

    private var translations: Languages?
    private(set) var currentLocale: Locale!

    init(
            dataManager: DataManager,
            restClient: RestClient) {
        self.dataManager = dataManager
        self.restClient = restClient
        self.loadTranslations()
    }

    func loadTranslations() {
        self.translations = self.dataManager.get(key: SettingKey.translations, type: Languages.self) ?? self.loadDefaultTranslations()
        self.currentLocale = self.getLocale()
        log.debug("Current locale: \(self.currentLocale.identifier)")
        log.debug("Loaded languages: \(self.translations?.count ?? 0)")
    }

    func fetchTranslations() -> Completable {
        let request = self.restClient.request(GeneralEndpoints.FetchTranslations())

        return request
                .do(onSuccess: { [weak self] response in
                    self?.dataManager.set(key: SettingKey.translations, value: response.languages)
                    self?.loadTranslations()
                })
                .asCompletable()
    }

    func getCurrentTranslations() -> [String:String]? {
        let localeId = self.currentLocale.identifier.replacingOccurrences(of: "_", with: "-")
        let translations = self.translations?[localeId]
        return translations
    }

    private func getLocale() -> Locale {
        if let preferred = Locale.preferredLanguages
                .first(where: { self.translations?[$0.replacingOccurrences(of: "_", with: "-")] != nil }) {

            return Locale(identifier: preferred)
        }

        return Locale(identifier: "en_GB")
    }

    private func loadDefaultTranslations() -> Languages {
        if let json = FileUtils.loadTextFile(with: "translations", ofType: "json"),
           let data = json.data(using: .utf8),
           let translations = data.toObject(TranslationsResponse.self) {

            return translations.languages
        }

        return [:]
    }
}