//
//  Coordinator.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 20/03/21.
//

import UIKit

protocol Coordinator {
    
    var childCoordinator: CoordinatorStack<Coordinator> {get set}
    var navigationController: UINavigationController {get set}
    
    func start()

}
