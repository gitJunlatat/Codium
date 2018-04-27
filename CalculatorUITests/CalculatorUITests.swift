//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by yothin junlatat on 20/3/2561 BE.
//  Copyright © 2561 yothin junlatat. All rights reserved.
//

import XCTest

class CalculatorUITests: XCTestCase {
    var app: XCUIApplication!
    var checkBtn: XCUIElement!
    var result: XCUIElement!
    var formular: XCUIElement!
    
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        checkBtn = app.buttons["Check result"]
        formular = app.textFields["formular"]
        result = app.staticTexts.element(matching: .any, identifier: "result")
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
//        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }


    private func calculated(formularSet: String, resultExpected: String) {
        
        formular.tap()
        formular.typeText(formularSet)
        checkBtn.tap()
        
        XCTAssert(result.label == resultExpected)
        
        formular.clearText()
        
        if formularSet == "" {
            sleep(2)
        }
    }
    
    
    func testTapFailure() {
        app.launch()
        
        
        calculated(formularSet: "", resultExpected: "Please input some formular below!")
        sleep(1)
        
        var dataSet:[String: String] = [:]
        dataSet.updateValue("14.0", forKey: "1 + 1 + 3 + 5 + 4")
        dataSet.updateValue("120.0", forKey: "1 * 2 * 3 * 4 * 5")
        dataSet.updateValue("6.95", forKey: "1 + 2 * 3 - 1 / 20")
        dataSet.updateValue("10.0833333333333", forKey: "1 / 20 / 30 * 50 + 10")
        dataSet.updateValue("7401.0", forKey: "1 + (29 + 45) * 100")
        dataSet.updateValue("6.0", forKey: "1 + 50 / 20 * (1 + 1)")
        dataSet.updateValue("179.0", forKey: "90 / 10 * (20 + 0) - 1")

        for data in dataSet {
            calculated(formularSet: data.key, resultExpected: data.value)
        }
        
        for data in dataSet {
            calculated(formularSet: data.key, resultExpected: data.value)
        }
        
        for data in dataSet {
            calculated(formularSet: data.key, resultExpected: data.value)
        }
        
        for data in dataSet {
            calculated(formularSet: data.key, resultExpected: data.value)
        }
        


    }
    
    func testExample() {
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}

extension XCUIElement {
    func clearText() {
        guard let stringValue = self.value as? String else {
            return
        }
        
        var deleteString = String()
        for _ in stringValue {
            deleteString += XCUIKeyboardKey.delete.rawValue
        }
        self.typeText(deleteString)
    }
}
