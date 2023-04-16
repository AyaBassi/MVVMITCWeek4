//
//  LoginViewModelTests.swift
//  MVVMPracticeTests
//
//  Created by Aya Bassi on 13/04/2023.
//

import XCTest
@testable import MVVMPractice
final class LoginViewModelTests: XCTestCase {

    var loginViewModel: LoginViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginViewModel = LoginViewModel()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        loginViewModel = nil
    }
    
    func testIsValidLoggingIn(){
        let result = loginViewModel.isValidLoggingIn(email: "aas@gmail.com", password: "123456")
        XCTAssertTrue(result)
    }
    
    func testIsValidLoggingInWithEmptyEmail(){
        let result = loginViewModel.isValidLoggingIn(email: "", password: "123456")
        XCTAssertFalse(result)
    }
    
    func testIsValidLoggingInWithEmptyPassword(){
        let result = loginViewModel.isValidLoggingIn(email: "aas@gmail.com", password: "")
        XCTAssertFalse(result)
    }
    
    func testIsValidLoggingInWithEmptyEmailAndPassword(){
        let result = loginViewModel.isValidLoggingIn(email: "", password: "")
        XCTAssertFalse(result)
    }
    
    func testIsValidLoggingInWithInvalidEmail(){
        let result = loginViewModel.isValidLoggingIn(email: "aasgmail.com", password: "123456")
        XCTAssertFalse(result)
    }
    
    func testIsValidLoggingInValidEmailAndPasswordMoreThanRequired(){
        let result = loginViewModel.isValidLoggingIn(email: "aas@gmail.com", password: "1234567")
        XCTAssertTrue(result)
    }
    
    func testIsValidLoggingInValidEmailAndInvalidPasswordLength(){
        let result = loginViewModel.isValidLoggingIn(email: "aas@gmail.com", password: "12345")
        XCTAssertFalse(result)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
