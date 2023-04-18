//
//  StubbingNetworkManager.swift
//  MVVMPracticeTests
//
//  Created by Payam Karbassi on 17/04/2023.
//

import Foundation
@testable import MVVMPractice

class StubbingNetworkManager : NetwokableProtocol {
    var array = [Fruit]()
    
    func callAPIToGetData<T>(with urlString: String, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        completion(.success(array as! T))
    }
    
    
}
