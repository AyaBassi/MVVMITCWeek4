//
//  FakeNetworkManger.swift
//  MVVMPracticeTests
//
//  Created by Aya Bassi on 14/04/2023.
//

import Foundation

@testable import MVVMPractice

class FakeNetworkManger : NetwokableProtocol {
    
    func callAPIToGetData(with urlString: String, completion: @escaping (Result<[MVVMPractice.Fruit], Error>) -> Void) {
        print("Called in fake network")
        
        
        
        completion(.success([]))
    }
}
