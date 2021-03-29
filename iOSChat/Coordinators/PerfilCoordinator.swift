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
    
    var user: UserModel
    
    init(_ navigationController: UINavigationController, user: UserModel) {
        self.navigationController = navigationController
        self.user = user
    }
    
    func start() {
        
        let perfilVC = PerfilViewController()
        var viewModel = PerfilViewModel(user: user)
        viewModel.delegate = self
        perfilVC.viewModel = viewModel
        navigationController.tabBarItem.image = UIImage(systemName: Constants.TabBar.TabBarImage.perfil.rawValue)
        navigationController.tabBarItem.selectedImage = UIImage(systemName: Constants.TabBar.TabBarImage.perfil.rawValue)
        navigationController.tabBarItem.title = Constants.TabBar.TabBarTitle.perfil.rawValue
        navigationController.pushViewController(perfilVC, animated: false)
        
    }
    
    func pop() {
        navigationController.popViewController(animated: false)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: false)
    }
    
}

extension PerfilCoordinator: PerfilViewModelCoordinatorProtocol {
    
    
    func goToDetails(userModel: UserModel) {
        let perfilDetailsVC         = PerfilDetailsViewController()
        let detailsViewModel        = PerfilDetailsViewModel(user: userModel)
        detailsViewModel.delegate   = self
        perfilDetailsVC.viewModel   = detailsViewModel
        navigationController.pushViewController(perfilDetailsVC, animated: true)
    }
    
    func goToSettings(userModel: UserModel) {
        let perfilSettingsVC        = PerfilSettingsViewController()
        let setingsViewModel        = PerfilSettingsViewModel(user: userModel)
        perfilSettingsVC.viewModel  = setingsViewModel
        navigationController.pushViewController(perfilSettingsVC, animated: true)
    }
    
    func userLogout() {
        NotificationCenter.default.post(name: Constants.ObserverNames.logoutUser, object: nil)
    }
    
    
}

extension PerfilCoordinator: PerfilDetailsViewModelProtocol {
    func PerfilDetailsViewModelDidFinished() {
        pop()
    }
}
