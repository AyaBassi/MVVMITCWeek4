//
//  TableViewCoordinator.swift
//  MVVMPractice
//
//  Created by Payam Karbassi on 13/05/2023.
//

import UIKit

class TableViewCoordinator: ChildCoordinatableProtocol {
    
    var navigationController: UINavigationController?
    
    static let shared = TableViewCoordinator()
    private init(){}
    func goToDetailsViewController(){
        let detailsVC = DetailsViewContoller()
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}
