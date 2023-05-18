//
//  LoginViewCoordinator.swift
//  MVVMPractice
//
//  Created by Payam Karbassi on 13/05/2023.
//

import UIKit
class LoginViewCoordinator : ChildCoordinatableProtocol {
    static let shared = LoginViewCoordinator()
    private init(){}

    var navigationController: UINavigationController?
    
    func goToTableView(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tableVC = storyboard.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        
        //tableVC.mainCoordinator = self
        navigationController?.pushViewController(tableVC, animated: true)
    }
}
