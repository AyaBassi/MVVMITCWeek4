//
//  NetworkableProtocol.swift
//  MVVMPractice
//
//  Created by Aya Bassi on 15/04/2023.
//

import Foundation

protocol NetwokableProtocol{
    func callAPIToGetData(with urlString:String,completion:@escaping(Result<[Fruit],Error>) -> Void)
}
