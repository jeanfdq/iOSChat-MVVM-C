//
//  PerfilCoordinator.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

class PerfilCoordinator: NSObject, Coordinator {
    
    var childCoordinator = CoordinatorStack<Coordinator>()
    
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        navigationController.tabBarItem.image = UIImage(systemName: Constants.TabBar.TabBarImage.perfil.rawValue)
        navigationController.tabBarItem.selectedImage = UIImage(systemName: Constants.TabBar.TabBarImage.perfil.rawValue)
        navigationController.tabBarItem.title = Constants.TabBar.TabBarTitle.perfil.rawValue
        navigationController.pushViewController(PerfilViewController(), animated: false)
        
    }
    
    func pop() {
        navigationController.popViewController(animated: false)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: false)
    }
    
}
