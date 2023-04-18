//
//  TableViewViewModelMockingTests.swift
//  MVVMPracticeTests
//
//  Created by Payam Karbassi on 17/04/2023.
//

import XCTest
@testable import MVVMPractice
final class TableViewViewModelMockingTests: XCTestCase {

    var tableViewViewModel : TableViewControllerViewModel!
    var fruits : [Fruit] = []
    override func setUpWithError() throws {
        tableViewViewModel = TableViewControllerViewModel(anyManager: MockingNetworkManager())
        tableViewViewModel.getFruitsDetailsWithClosure(url: "FruitsFile") {
            self.fruits = self.tableViewViewModel.fruits
        }
    }

    override func tearDownWithError() throws {
        tableViewViewModel = nil
        fruits = []
    }

    func testCountActualCount() throws {
        XCTAssertEqual(fruits.count, 1)
    }
    
    func testCountsFakeCount() throws {
        XCTAssertNotEqual(fruits.count, 2)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
