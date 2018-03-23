//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by yothin junlatat on 20/3/2561 BE.
//  Copyright © 2561 yothin junlatat. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var viewController = ViewController()

    
    // TO DO case P' boy'is
//    1 + 1 = 2
//    2 + 2 = 4
//    4 * 4 = 16
//    999/0 = Infinity
//    0/999 = 0
//    2 - 1 = 1
//    1 - 2 = -1
//    1 / 2 = 1.5
//    3 / 5 = 0.6
    
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCalculate() {
        XCTAssertEqual(viewController.calculate(expression: "1+1"), "2")
        XCTAssertEqual(viewController.calculate(expression: "2+2"), "4")
        XCTAssertEqual(viewController.calculate(expression: "4*4"), "16")
        XCTAssertEqual(viewController.calculate(expression: "999/0"), "Infinity")
        XCTAssertEqual(viewController.calculate(expression: "0/999"), "0")
        XCTAssertEqual(viewController.calculate(expression: "2-1"), "1")
        XCTAssertEqual(viewController.calculate(expression: "1-2"), "-1")
        XCTAssertEqual(viewController.calculate(expression: "1/2"), "0.5")
        XCTAssertEqual(viewController.calculate(expression: "3/5"), "0.6")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
