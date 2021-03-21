//
//  ConstactsCoordinator.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

class ConstactsCoordinator: NSObject, Coordinator {
    
    var childCoordinator = CoordinatorStack<Coordinator>()
    
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let vc = ContactsViewController()
        navigationController.tabBarItem.image = UIImage(systemName: Constants.TabBar.TabBarImage.contacts.rawValue)
        navigationController.tabBarItem.selectedImage = UIImage(systemName: Constants.TabBar.TabBarImage.contacts.rawValue)
        navigationController.tabBarItem.title = Constants.TabBar.TabBarTitle.contacts.rawValue
        navigationController.pushViewController(vc, animated: false)
    }
    
    
    
    
}
