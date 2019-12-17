//
//  TestUITests.swift
//  TestUITests
//
//  Created by Tibor Bodecs on 2019. 12. 15..
//  Copyright © 2019. Tibor Bodecs. All rights reserved.
//

import XCTest


private extension XCUIApplication {
    var inputField: XCUIElement { self.textFields["input-field"] }
    var submitButton: XCUIElement { self.buttons["submit-button"] }
}

class TestUITests: XCTestCase {
    
    override func setUp() {
        self.continueAfterFailure = false
    }
    
    func testSubmitValue() {
        let app = XCUIApplication.launchTest()
        
        let expectation = "Hello world"
        app.inputField.tap()
        app.inputField.typeText(expectation)
        app.submitButton.tap()
        
        XCTAssertTrue(app.staticTexts[expectation].exists)
    }
    
    func testHello() {
        let app = XCUIApplication.launchTest(module: "Hello")
        
        XCTAssertTrue(app.staticTexts["Hello"].exists)
    }
    
    
    func testLaunchPerformance() {
        self.measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
            XCUIApplication().launch()
        }
    }
}
