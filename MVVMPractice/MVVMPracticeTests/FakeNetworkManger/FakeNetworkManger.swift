//
//  FakeNetworkManger.swift
//  MVVMPracticeTests
//
//  Created by Aya Bassi on 14/04/2023.
//

import Foundation

@testable import MVVMPractice

class FakeNetworkManger : NetwokableProtocol {
    
    func callAPIToGetData<T>(with urlString: String, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        let bundle = Bundle(for: NetworkManager.self)
        guard let url = URL(string: urlString) else { return }
        guard let path = bundle.url(forResource: url.absoluteString, withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: path)
            let list = try JSONDecoder().decode(T.self, from: data )
            completion(.success(list))
        } catch {
            completion(.failure(error))
            print(error.localizedDescription)
        }
    }
}



        
    
