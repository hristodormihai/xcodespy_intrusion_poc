//
//  XCUIApplication+Test.swift
//  TestUITests
//
//  Created by Tibor Bodecs on 2019. 12. 15..
//  Copyright © 2019. Tibor Bodecs. All rights reserved.
//

import XCTest

extension XCUIApplication {

    static func launchTest(module: String = "Main") -> XCUIApplication {
        let app = XCUIApplication()
        app.launchArguments = ["-test"]
        app.launchEnvironment = ["module": module]
        app.launch()
        return app
    }
}

