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
    
    var user: UserModel
    
    init(_ navigationController: UINavigationController, user: UserModel) {
        self.navigationController = navigationController
        self.user = user
    }
    
    func start() {
        
        let vc = ContactsViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let vm = ContactsViewModel(user)
        vm.delegate = self
        vc.viewModel = vm
        
        navigationController.tabBarItem.image = UIImage(systemName: Constants.TabBar.TabBarImage.contacts.rawValue)
        navigationController.tabBarItem.selectedImage = UIImage(systemName: Constants.TabBar.TabBarImage.contacts.rawValue)
        navigationController.tabBarItem.title = Constants.TabBar.TabBarTitle.contacts.rawValue
        navigationController.pushViewController(vc, animated: false)
    }
     
}

extension ConstactsCoordinator: ContactsViewModelProtocol {
    func openChat(userDestination: UserModel) {
       
        let chatVC = ChatViewController(userDestination: userDestination)
        navigationController.pushViewController(chatVC, animated: true)
        
    }
}
