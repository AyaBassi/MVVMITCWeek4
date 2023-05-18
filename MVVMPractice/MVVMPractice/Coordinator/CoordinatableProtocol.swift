//
//  CoordinatableProtocol.swift
//  MVVMPractice
//
//  Created by Payam Karbassi on 12/05/2023.
//

import UIKit

protocol CoordinatableProtocol {
    var childCoordinators: [ChildCoordinatableProtocol] {get}
    var navigationController : UINavigationController { get set}
    func startCoordinator()
}

protocol ChildCoordinatableProtocol {
    var navigationController : UINavigationController?{get set}
}


