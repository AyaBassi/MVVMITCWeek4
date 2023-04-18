//
//  TableViewViewModelStubbingTests.swift
//  MVVMPracticeTests
//
//  Created by Payam Karbassi on 17/04/2023.
//

import XCTest
@testable import MVVMPractice
final class TableViewViewModelStubbingTests: XCTestCase {
    
    var tableViewModel : TableViewControllerViewModel!
    var stubbingNetworkManager : StubbingNetworkManager!
    
    override func setUpWithError() throws {
        stubbingNetworkManager = StubbingNetworkManager()
        
        
        tableViewModel = TableViewControllerViewModel(anyManager: stubbingNetworkManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
       tableViewModel = nil
        stubbingNetworkManager = nil
    }

    func testCountWithActualCount() {
        stubbingNetworkManager.array = [Fruit(genus: "Asian", name: "Hamzah", id: 0, family: "Pakistan", order: "iOS", nutritions: Nutrition(carbohydrates: 2.5, protein: 2, fat: 2, calories: 100, sugar: 2))]
        tableViewModel.getFruitsDetailsWithClosure(url: "") {
            XCTAssertEqual(self.tableViewModel.fruits.count, 1)
        }
        
    }
    
    func testCountWithFakeCount() {
        stubbingNetworkManager.array = []
        tableViewModel.getFruitsDetailsWithClosure(url: "") {
            XCTAssertNotEqual(self.tableViewModel.fruits.count, 2)
        }
    }
    
    func testForVariables(){
        //
    }
    
    func testForIncorrectnessOfVariables(){
       //
    }

    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
