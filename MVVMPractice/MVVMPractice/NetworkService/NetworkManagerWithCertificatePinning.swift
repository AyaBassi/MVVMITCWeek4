//
//  NetworkManagerWithCertificatePinning.swift
//  MVVMPractice
//
//  Created by Payam Karbassi on 18/05/2023.
//

import Foundation


import Foundation

class NetworkManagerWithCertificatePinning : NSObject, NetwokableProtocol{
    
    static var fruits : [Fruit]?
    
    func callAPIToGetData<T>(with urlString: String, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        guard let url = URL(string: urlString) else {print("DEBUG: Failed to get URL");return}
        
        
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
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

extension NetworkManagerWithCertificatePinning : URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        // create server certificate
        
        // 1. extracting certificate from host
        guard let serverTrust = challenge.protectionSpace.serverTrust else {
            return completionHandler(.cancelAuthenticationChallenge,nil)
        }
        
        let certificate = SecTrustGetCertificateAtIndex(serverTrust, 0)
     
        // 2. SSL policies for domain check
        let policy = NSMutableArray()
        policy.add( SecPolicyCreateSSL(true, challenge.protectionSpace.host as CFString))
        
        //3. evaluate the server certifcate whether its a trusted or no
        
        let isServerTruted = SecTrustEvaluateWithError(serverTrust, nil)
        
        // local and remote certificate data
        let remoteCertificateData : NSData = SecCertificateCopyData(certificate! as! SecCertificate)
        
        
        guard let pathToCertificate = Bundle.main.path(forResource: "analytics.fruityvice.com", ofType: "cer") else {
            return completionHandler(.cancelAuthenticationChallenge,nil)
        }
        
        let localCertificateData = try NSData(contentsOfFile: pathToCertificate)
        
        if (isServerTruted && remoteCertificateData.isEqual(to: localCertificateData as! Data)){
            print("SSL Pinning is successful")
            let credentials = URLCredential(trust: serverTrust)
            return completionHandler(.useCredential,credentials)
            
        } else {
            print("SSL Pinning Failed ")
            return completionHandler(.cancelAuthenticationChallenge,nil)
        }
        
    }
}








