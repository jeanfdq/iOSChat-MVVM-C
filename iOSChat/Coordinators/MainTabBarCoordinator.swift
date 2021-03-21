//
//  MainTabBarCoordinator.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 20/03/21.
//

import UIKit

protocol MainTabBarCoordinatorDelegate: class {
    
}

class MainTabBarCoordinator: NSObject, Coordinator {
    
    weak var coordinator: MainTabBarCoordinatorDelegate?
    
    var childCoordinator = CoordinatorStack<Coordinator>()
    
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let mainTabBarViewController = MainTabBarViewController()
        navigationController.pushViewController(mainTabBarViewController, animated: false)
        
    }
    
}
