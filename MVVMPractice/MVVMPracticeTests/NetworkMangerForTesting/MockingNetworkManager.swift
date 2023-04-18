//
//  MockingNetworkManager.swift
//  MVVMPracticeTests
//
//  Created by Payam Karbassi on 17/04/2023.
//

import Foundation
@testable import MVVMPractice

class MockingNetworkManager :NetwokableProtocol {
    func callAPIToGetData<T>(with urlString: String, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        let mockingArray = [Fruit(genus: "Asian", name: "Hamzah", id: 0, family: "Pakistan", order: "iOS", nutritions: Nutrition(carbohydrates: 2.5, protein: 2, fat: 2, calories: 100, sugar: 2))]
        completion(.success(mockingArray as! T))
        
        
    }
}
