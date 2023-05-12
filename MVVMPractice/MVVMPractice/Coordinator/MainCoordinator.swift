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
    
    var childCoordinators: [CoordinatableProtocol] = []
    
    var navigationController: UINavigationController = UINavigationController()
    
    func startCoordinator() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        //loginVC.mainCoordinator = self
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    func goToTableView(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tableVC = storyboard.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        
        //tableVC.mainCoordinator = self
        self.navigationController.pushViewController(tableVC, animated: true)
    }
    
    func goToDetailsViewController(){
        let detailsVC = DetailsViewContoller()
        navigationController.pushViewController(detailsVC, animated: true)
    }
}
