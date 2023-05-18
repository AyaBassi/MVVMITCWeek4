//
//  MainCoordinator.swift
//  MVVMPractice
//
//  Created by Payam Karbassi on 12/05/2023.
//

import UIKit
class MainCoordinator : CoordinatableProtocol{
    
    static let shared = MainCoordinator()
    private init(){}
    var navigationController: UINavigationController = UINavigationController()
    
    var childCoordinators: [ChildCoordinatableProtocol] = [
        LoginViewCoordinator.shared.self,
        TableViewCoordinator.shared.self,
        DetailsViewCoordinator()
    ]
    
    func startCoordinator() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController.pushViewController(loginVC, animated: true)
        
        for var childCoordinator in childCoordinators {
            childCoordinator.navigationController = self.navigationController
        }
    }
}
