//
//  NetworkManager.swift
//  MVVMPractice
//
//  Created by Aya Bassi on 13/04/2023.
//

import Foundation

class NetworkManager : NetwokableProtocol {
    
    static var fruits : [Fruit]?
    
    func callAPIToGetData<T>(with urlString: String, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        guard let url = URL(string: urlString) else {print("DEBUG: Failed to get URL");return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response , error  in
            if let error = error {
                print("DEBUG: Error: ",error.localizedDescription )
                completion(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("DEBUG: Error getting response")
                return
            }
            guard let data = data else {print("DEBUG: Couldn't get data from api");return}
            
            do {
                let dataList = try JSONDecoder().decode(T.self, from: data)
                //NetworkManager.fruits = Fruit(dataList)
                completion(.success(dataList))
                
            }catch{
                print("DEBUG: error decoding : \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}








