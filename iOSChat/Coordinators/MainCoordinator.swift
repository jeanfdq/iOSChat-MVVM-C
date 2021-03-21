//
//  MainCoordinator.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 20/03/21.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    var childCoordinator = CoordinatorStack<Coordinator>()
    
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        showLauchScreen()
    }
    
    private func showLauchScreen(){
        
        let viewModel = LaunchScreenViewModel()
        let vc = LauchScreenViewController(viewModel)
        viewModel.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {return }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
    }
    
}

extension MainCoordinator: LaunchScreenViewModelCoordinatorDelegate {
    
    func launchScreenCoordinatorGoToMainTabBar() {
        goToMainTabBarCoordinator()
    }
    
}

extension MainCoordinator: MainTabBarCoordinatorDelegate {
    
    func goToMainTabBarCoordinator() {
        
        let mainTabBarCoordinator = MainTabBarCoordinator(navigationController)
        childCoordinator.push(mainTabBarCoordinator)
        mainTabBarCoordinator.coordinator = self
        mainTabBarCoordinator.start()
    }
    
}
