//
//  TableViewControllerViewModel.swift
//  MVVMPractice
//
//  Created by Aya Bassi on 13/04/2023.
//

import Foundation


class TableViewControllerViewModel {
    var fruits : [Fruit] = []
    //let networkManager = NetworkManager()
    //var reloadTableView:(()->Void)?
    
    let anyManager : NetwokableProtocol
    
    init(anyManager: NetwokableProtocol) {
        self.anyManager = anyManager
    }
    
    func getFruitsDetailsWithClosure(url:String,completion: @escaping ()->Void){
        anyManager.callAPIToGetData(with: url) { (result : Result<[Fruit],Error>) in
            switch result {
            case .success(let dataList):
                self.fruits = dataList
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


//anyManager.callAPIToGetData(with: url) { result in
//
//    switch result {
//    case .success(let dataList):
//        self.fruits = dataList
//        completion()
//    case .failure(let error ):print(error.localizedDescription)
//    }
//}
