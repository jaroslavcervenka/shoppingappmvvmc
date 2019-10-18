//
// Created by Jaroslavc Cervenka on 13/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

protocol DataManager {

    func get<T>(key: String, type: T.Type) -> T? where T : Codable

    func get(key: String) -> String?

    func set<T>(key: String, value: T?) where T : Codable

    func remove(key: String)

    func clear()
}