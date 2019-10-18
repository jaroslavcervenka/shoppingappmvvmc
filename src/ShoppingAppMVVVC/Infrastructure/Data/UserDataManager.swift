//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

class UserDataManager: DataManager {
    private var data: [String:String]

    init() {
        self.data = UserDefaults.standard
                .data(forKey: "data")?
                .toObject([String:String].self) ?? [:]
    }

    func get<T>(key: String, type: T.Type) -> T? where T : Codable {
        let result = self.data[key]?.data(using: .utf8)?.toObject(type)
        return result
    }

    func get(key: String) -> String? {
        return self.data[key]
    }

    func set<T>(key: String, value: T?) where T : Codable {
        log.debug("Setting data for key \(key).")
        if let json = value?.toJson() {
            self.data[key] = String(data: json, encoding: .utf8)
            self.synchronize()
        }
    }

    func remove(key: String) {
        log.debug("Removing data for key \(key).")
        self.data.removeValue(forKey: key)
        self.synchronize()
    }

    func clear() {
        self.data.removeAll()
        self.synchronize()
    }

    private func synchronize() {
        UserDefaults.standard.set(self.data.toJson(), forKey: "data")
    }
}