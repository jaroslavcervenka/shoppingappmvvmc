//
// Created by Jaroslavc Cervenka on 18/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import SwiftyBeaver
import XCoordinator

extension AppDelegate {

    static func configureLogger(){
        let console = ConsoleDestination()
        console.format = "$DHH:mm:ss.SSS$d $C$L$c $N.$F:$l - $M $X"
        console.levelColor.verbose = "⚪️ "
        console.levelColor.debug = "☑️ "
        console.levelColor.info = "🔵 "
        console.levelColor.warning = "🔶 "
        console.levelColor.error = "🔴 "

        #if DEBUG
        console.minLevel = .verbose
        console.asynchronously = false
        #else
        console.minLevel = .error
        #endif

        log.addDestination(console)
    }

    static func configureContainer(){
        self.container.registerDependencies()
    }
}