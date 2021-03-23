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

        let vc = PerfilViewController()
        var vm = PerfilViewModel()
        vm.delegate = self
        vc.viewModel = vm
        navigationController.tabBarItem.image = UIImage(systemName: Constants.TabBar.TabBarImage.perfil.rawValue)
        navigationController.tabBarItem.selectedImage = UIImage(systemName: Constants.TabBar.TabBarImage.perfil.rawValue)
        navigationController.tabBarItem.title = Constants.TabBar.TabBarTitle.perfil.rawValue
        navigationController.pushViewController(vc, animated: false)
        
    }
    
    func pop() {
        navigationController.popViewController(animated: false)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: false)
    }
    
}

extension PerfilCoordinator: PerfilViewModelCoordinatorProtocol, PerfilChooseCoordinatorProtocol, PerfilLoginViewModelProtocol {
    
    
    
    func showPerfilScreen(_ isLogged: Bool) {
        
        if !isLogged {

            let perfilChoose    =    PerfilChooseViewController()
            var vm                  = PerfilChooseViewModel()
            vm.delegate             = self
            perfilChoose.viewModel  = vm
            
            navigationController.pushViewController(perfilChoose, animated: false)
        }
    }
    
    func goToLogin() {
        
        let signUp = PerfilLoginViewController()
        navigationController.pushViewController(signUp, animated: true)
        
    }
    
    func goToSignUp() {
        
        let signUp = PerfilSignUpViewController()
        navigationController.pushViewController(signUp, animated: true)
        
    }
    
}
