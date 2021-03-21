//
//  HomeCoordinator.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

class HomeCoordinator: NSObject, Coordinator {
    
    var childCoordinator = CoordinatorStack<Coordinator>()
    
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let vc = HomeViewController()
        navigationController.navigationBar.barTintColor = .white
        navigationController.tabBarItem.title = Constants.TabBar.TabBarTitle.home.rawValue
        navigationController.tabBarItem.image = UIImage(systemName: Constants.TabBar.TabBarImage.home.rawValue)
        navigationController.tabBarItem.selectedImage = UIImage(systemName: Constants.TabBar.TabBarImage.home.rawValue)
        navigationController.pushViewController(vc, animated: false)
    }
    
}
