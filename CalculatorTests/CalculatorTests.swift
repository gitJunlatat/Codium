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
//
//    1 + 1 + 3 + 5 + 4 = 14
//    1 * 2 * 3 * 4 * 5 = 120
//    1 + 2 * 3 - 1 / 20 = 6.95
//    1 / 20 / 30 * 50 + 10 = 10.0833333333
//    1 + (29 + 45) * 100 = 7401
//    1 + 50 / 20 * (1 + 1) = 6
//    90 / 10 * (20 + 0) - 1 = 179
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCalculate() {
        XCTAssertEqual(viewController.actionCal(text: "1+1"), "2.0")
        XCTAssertEqual(viewController.actionCal(text: "2+2"), "4.0")
        XCTAssertEqual(viewController.actionCal(text: "4*4"), "16.0")
        XCTAssertEqual(viewController.actionCal(text: "999/0"), "inf")
        XCTAssertEqual(viewController.actionCal(text: "0/999"), "0.0")
        XCTAssertEqual(viewController.actionCal(text: "2-1"), "1.0")
        XCTAssertEqual(viewController.actionCal(text: "1-2"), "-1.0")
        XCTAssertEqual(viewController.actionCal(text: "1/2"), "0.5")
        XCTAssertEqual(viewController.actionCal(text: "3/5"), "0.6")
        
        XCTAssertEqual(viewController.actionCal(text: "1 + 1 + 3 + 5 + 4"), "14.0")
        XCTAssertEqual(viewController.actionCal(text: "1 * 2 * 3 * 4 * 5"), "120.0")
        XCTAssertEqual(viewController.actionCal(text: "1 + 2 * 3 - 1 / 20"), "6.95")
        XCTAssertEqual(viewController.actionCal(text: "1 / 20 / 30 * 50 + 10"), "10.0833333333333")
        
        XCTAssertEqual(viewController.actionCal(text: "1 + (29 + 45) * 100"), "7401.0")
        XCTAssertEqual(viewController.actionCal(text: "1 + 50 / 20 * (1 + 1)"), "6.0")
        XCTAssertEqual(viewController.actionCal(text: "90 / 10 * (20 + 0) - 1"), "179.0")


    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
