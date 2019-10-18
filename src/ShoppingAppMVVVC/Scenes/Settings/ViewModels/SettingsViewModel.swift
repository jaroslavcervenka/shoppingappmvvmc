//
// Created by Jaroslavc Cervenka on 12/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import RxSwift

class SettingsViewModel {

    // values
    let title = "Settings".localized
    let notifications = BehaviorSubject(value: false)
    let debug = BehaviorSubject(value: false)

    private let dataManager: DataManager
    private let disposeBag = DisposeBag()

    init(
            dataManager: DataManager) {

        self.dataManager = dataManager
        self.setUpBindings()
    }

    private func setUpBindings() {
        var appSettings = self.dataManager.get(key: SettingKey.appSettings, type: AppSettings.self)

        if(appSettings == nil){
            appSettings = self.initializeSettings()
        }

        self.notifications.onNext(appSettings!.notifications)
        self.debug.onNext(appSettings!.debug)
        let dataManager = self.dataManager

        Observable
                .combineLatest(self.notifications, self.debug)
                .subscribe(onNext: { [weak self] notifications, debug in
                    guard (dataManager.get(key: SettingKey.appSettings, type: AppSettings.self)) != nil else { return }

                    let newAppSettings = AppSettings(
                            notifications: notifications,
                            debug: debug)
                    self?.dataManager.set(key: SettingKey.appSettings, value: newAppSettings)
                })
                .disposed(by: self.disposeBag)
    }
    
    private func initializeSettings() -> AppSettings {
        log.debug("Initialize settings")
        let appSettings = AppSettings.withDefaultValues()
        self.dataManager.set(key: SettingKey.appSettings, value: appSettings)

        return appSettings
    }
}