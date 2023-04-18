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
    var fruits : [Fruit] = []
    override func setUpWithError() throws {
        
        tableViewViewModel = TableViewControllerViewModel(anyManager: FakeNetworkManger())
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        tableViewViewModel = nil
        fruits = []
    }
    
    func testJsonDataForCounts(){
        XCTAssertEqual(fruits.count, 6)
    }

    func testJsonDataVariablesWhichShouldPass(){
        tableViewViewModel.getFruitsDetailsWithClosure(url: "FruitsFile") {
            guard let fruit = self.tableViewViewModel.fruits.first else {return}
 
                XCTAssertEqual(fruit.name, "Persimmon","name variable")
                XCTAssertEqual(fruit.id, 52,"id")
                XCTAssertEqual(fruit.order, "Rosales","order")
                XCTAssertEqual(fruit.genus, "Diospyros","genus")
                XCTAssertEqual(fruit.nutritions.calories, 81,"nutritions.calories")
                XCTAssertEqual(fruit.nutritions.fat, 0.0,"nutritions.fat")
                XCTAssertEqual(fruit.nutritions.sugar, 18.0,"nutritions.sugar")
                XCTAssertEqual(fruit.nutritions.carbohydrates, 18.0,"nutritions.carbohydrates")
                XCTAssertEqual(fruit.nutritions.protein, 0.0,"proties")
        }
    }
    
    func testJsonDataVariablesWhichShouldNotPass(){
        tableViewViewModel.getFruitsDetailsWithClosure(url: "FruitsFile") {
            guard let fruit = self.tableViewViewModel.fruits.first else {return}
            XCTAssertNotEqual(fruit.name, "Persimmo","name")
            XCTAssertNotEqual(fruit.id, 5,"id")
            XCTAssertNotEqual(fruit.order, "Rosale","order")
            XCTAssertNotEqual(fruit.genus, "Diospyro","genus")
            XCTAssertNotEqual(fruit.nutritions.calories, 8,"nutritions.calories")
            XCTAssertNotEqual(fruit.nutritions.fat, 1,"fat")
            XCTAssertNotEqual(fruit.nutritions.sugar, 18.5,"nutritions.sugar")
            XCTAssertNotEqual(fruit.nutritions.carbohydrates, 18.5,accuracy:0.0, "nutritions.carbohydrates")
            XCTAssertNotEqual(fruit.nutritions.protein, 1,"protein")
            
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
