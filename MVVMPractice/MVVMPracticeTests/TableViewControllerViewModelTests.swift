//
//  TableViewControllerViewModelTests.swift
//  MVVMPracticeTests
//
//  Created by Aya Bassi on 14/04/2023.
//

import XCTest
@testable import MVVMPractice

final class TableViewControllerViewModelTests: XCTestCase {

    var tableViewViewModel : TableViewControllerViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        tableViewViewModel = TableViewControllerViewModel(anyManager: FakeNetworkManger())
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        tableViewViewModel = nil
    }

    func testSomething(){
        tableViewViewModel.getFruitsDetailsWithClosure(url: "") {
            print("done")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
