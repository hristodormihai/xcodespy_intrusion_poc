//
//  TestUnitTests.swift
//  TestUnitTests
//
//  Created by Tibor Bodecs on 2019. 12. 15..
//  Copyright © 2019. Tibor Bodecs. All rights reserved.
//

import XCTest
@testable import Dummy

class TestUnitTests: XCTestCase {
    
    func check(validator: Validator) {
        XCTAssert(validator.validate(email: "my.personal.address@google.co.uk") == true)
        XCTAssertTrue(validator.validate(email: "example@address.com"))
        XCTAssertFalse(validator.validate(email: ""))
        XCTAssertEqual(validator.validate(email: "invalid@address."), false)
        XCTAssertNotEqual(validator.validate(email: "lorem ipsum dolor sit amet"), true)
        XCTAssertFalse(validator.validate(email: "injection@example.com; DROP TABLE users"))
        XCTAssertFalse(validator.validate(email: "✉️"))
        XCTAssertFalse(validator.validate(email: "23983ujnvmfbbg73209refagjklnku129@adf@asdf.com"))
    }

    func testRegularExpressionValidator() {
        self.check(validator: RegularExpressionValidator())
    }
    
    func testDataDetectorValidator() {
        self.check(validator: DataDetectorValidator())
    }

    func testAsyncMethod() {
        let expectation = XCTestExpectation(description: "We should wait for the sample async method.")

        mySampleAysncMethod(delay: 2, response: "Hello Async!") { [weak expectation] result in
            XCTAssertEqual(result, "Hello Async!")
            expectation?.fulfill()
        }
        self.wait(for: [expectation], timeout: 3)
    }

    func testRegularExpressionValidatorPerformance() {
        self.measure {
            for _ in 0..<100 {
                self.testRegularExpressionValidator()
            }
        }
    }
    
    func testDataDetectorValidatorPerformance() {
        self.measure {
            for _ in 0..<100 {
                self.testDataDetectorValidator()
            }
        }
    }
}
