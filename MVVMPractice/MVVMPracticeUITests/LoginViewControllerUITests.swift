//
//  LoginViewControllerUITests.swift
//  MVVMPracticeUITests
//
//  Created by Payam Karbassi on 18/04/2023.
//

import XCTest
//@testable import MVVMPractice
final class LoginViewControllerUITests: XCTestCase {

    var app : XCUIApplication!
    //var tableViewModel  = TableViewControllerViewModel(anyManager: )

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        //tableViewModel = TableViewControllerViewModel(anyManager: FakeNetworkManger())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNameLabelExist() throws {
        let titleLabel = app.staticTexts["MVVM"]
        XCTAssertTrue(titleLabel.exists)
    }
    
    func testEmailTextFieldExist() throws {
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("abc@gmail.com")
        XCTAssertTrue(emailTextField.exists)
        
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("123456")
        XCTAssertTrue(passwordTextField.exists)
        
        let button = app.buttons["Login"]
        button.tap()
    }
    
    func testTableViewScreenLabel() throws {
        passLoginPage()
        
        // wait fo api call
        sleep(2)
        
        let tableQuery = app.tables
        
        XCTAssertTrue(tableQuery.cells.containing(.staticText, identifier: "Name: Persimmon").element.exists)
        XCTAssertTrue(checkForEachLabel(with: "Family: Ebenaceae"))
        XCTAssertTrue(checkForEachLabel(with: "Order: Rosales"))
        XCTAssertTrue(checkForEachLabel(with: "Nutritions"))
        XCTAssertTrue(checkForEachLabel(with: "Carbohydrate: 18.0"))
        XCTAssertTrue(checkForEachLabel(with: "Calories: 81"))
        XCTAssertTrue(checkForEachLabel(with: "Protiens: 0.0"))
        XCTAssertTrue(checkForEachLabel(with: "Fat: 0.0"))
        XCTAssertTrue(checkForEachLabel(with: "Sugar: 18.0"))
        
        let seeDetialsButton = app.buttons["See Details"]
        XCTAssertTrue(seeDetialsButton.exists)
        
    }
    
    
    
//    func testFlow() throws {
//
//        let app = XCUIApplication()
//        app.textFields["Email"].tap()
//        app.secureTextFields["Password"].tap()
//        app.buttons["Login"].tap()
//
//        let tablesQuery2 = app.tables
//        let tablesQuery = tablesQuery2
//        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Calories: 81").staticTexts["See Details"]/*[[".cells.containing(.staticText, identifier:\"Family: Ebenaceae\")",".buttons[\"See Details\"].staticTexts[\"See Details\"]",".staticTexts[\"See Details\"]",".cells.containing(.staticText, identifier:\"Name: Persimmon\")",".cells.containing(.staticText, identifier:\"Carbohydrate: 18.0\")",".cells.containing(.staticText, identifier:\"Sugar: 18.0\")",".cells.containing(.staticText, identifier:\"Calories: 81\")"],[[[-1,6,1],[-1,5,1],[-1,4,1],[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Family: Ebenaceae"]/*[[".cells.staticTexts[\"Family: Ebenaceae\"]",".staticTexts[\"Family: Ebenaceae\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        let seeDetailsButton = tablesQuery2.cells.containing(.staticText, identifier:"Name: Strawberry").buttons["See Details"]
//        seeDetailsButton.tap()
//        seeDetailsButton.swipeUp()
//
//    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func passLoginPage(){
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("asd@gmail.com")
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("1234567")
        
        let loginButton = app.buttons["Login"]
        loginButton.tap()
    }
    func checkForEachLabel(with identifier:String) -> Bool{
        let tableQuery = app.tables
        return tableQuery.cells.containing(.staticText, identifier: identifier).element.exists
    }
}


