//
//  CoordinatableProtocol.swift
//  MVVMPractice
//
//  Created by Payam Karbassi on 12/05/2023.
//

import UIKit

protocol CoordinatableProtocol {
    var childCoordinators: [CoordinatableProtocol] {get}
    //var childCoordinators: [CoordinatableProtocol] {get set}

    var navigationController : UINavigationController { get set}
    func startCoordinator()
}
