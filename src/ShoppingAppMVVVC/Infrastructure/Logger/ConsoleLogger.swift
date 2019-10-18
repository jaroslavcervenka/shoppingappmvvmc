//
// Created by Jaroslavc Cervenka on 12/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation

class ConsoleLogger : Logger{
    var logLevel = LogLevel.debug

    func debug(_ message: String) {
        guard logLevel.rawValue >= LogLevel.debug.rawValue else { return }
        log("\(getDate()) | DEBUG | \(message)")
    }

    func info(_ message: String) {
        guard logLevel.rawValue >= LogLevel.info.rawValue else { return }
        log("\(getDate()) | INFO | \(message)")
    }

    func error(_ message: String) {
        guard logLevel.rawValue >= LogLevel.error.rawValue else { return }
        log("\(getDate()) | ERROR | \(message)")
    }

    func error(_ message: String, error: Error?) {
        guard logLevel.rawValue >= LogLevel.error.rawValue else { return }
        if error != nil {
            log("\(getDate()) | ERROR | \(message)\n\(error!)")
        } else {
            log("\(getDate()) | ERROR | \(message)")
        }
    }

    private func log(_ message: String) {
        #if DEBUG
        print(message)
        #endif
    }

    private func getDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: Date())
    }
}