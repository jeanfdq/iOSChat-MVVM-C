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
        startOnboarding()
        
    }
    
    fileprivate func startOnboarding() {
        
        let isShowOnboarding: Bool = DefaultsManager.instance.get(key: .isShowOnboarding) ?? true
        
        if isShowOnboarding {
            showOnboarding()
        } else {
            showLauchScreen()
        }
    }
    
    fileprivate func showOnboarding() {
        let onboardingCoordinator = OnboardingCoordinator(navigationController)
        childCoordinator.push(onboardingCoordinator)
        onboardingCoordinator.coordinatorDelegate = self
        onboardingCoordinator.start()
    }
    
    fileprivate func showLauchScreen(){
        
        let viewModel = LaunchScreenViewModel()
        let vc = LauchScreenViewController(viewModel)
        viewModel.coordinator = self
        navigationController.pushViewController(vc, animated: false)
        
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {return }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
    }
    
}

extension MainCoordinator: OnboardingCoordinatorDelegate {    
    
    func onboardingDidFinish() {
        goToMainTabBarCoordinator()
        childCoordinator.pop()
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
