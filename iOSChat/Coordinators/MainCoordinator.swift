//
//  MainCoordinator.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 20/03/21.
//

import UIKit

private enum viewControllerType {
    case onboarding
    case splashscreen
    case main
}

class MainCoordinator  {
    
    var window: UIWindow?
    var navigation: UINavigationController?
    
    init( _ window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let showOnboarding: Bool = DefaultsManager.instance.get(key: .isShowOnboarding) ?? true
        startProcess(controller: showOnboarding ? .onboarding : .splashscreen)
    }
    
    fileprivate func registerObserver() {
        
    }
    
    fileprivate func startProcess(controller: viewControllerType) {
        
        navigation = UINavigationController(rootViewController: getViewController(with: controller))
        window?.rootViewController =  controller == .onboarding ?  navigation : getViewController(with: controller)
        window?.makeKeyAndVisible()
        
    }
    
    fileprivate func getViewController(with controller: viewControllerType) -> UIViewController {
        
        switch controller {
        case .main:
            return MainTabBarViewController()
        case .onboarding:
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let onboarding = OnBoardingViewController(collectionViewLayout: layout)
            onboarding.delegate = self
            return onboarding
        case .splashscreen:
            let viewModel = LaunchScreenViewModel()
            viewModel.coordinator = self
            return LauchScreenViewController(viewModel)
        }
        
    }
    
    fileprivate func getNavigation(viewController: UIViewController) -> UINavigationController {
        return UINavigationController(rootViewController: viewController)
    }
    
    fileprivate func popNavivgation(animated: Bool = false){
        navigation?.popViewController(animated: animated)
    }
}

extension MainCoordinator: OnBoardingCoordinatorDelagate {
    
    func goToLogin() {
        
        let loginVC             = PerfilLoginViewController()
        var loginViewModel      = PerfilLoginViewModel()
        loginViewModel.delegate = self
        loginVC.viewModel       = loginViewModel
        navigation?.pushViewController(loginVC, animated: true)
        
    }
    
    func goToSignUp() {
        
        let signUpVC                = PerfilSignUpViewController()
        var signUpViewModel         = PerfilSignUpViewModel()
        signUpViewModel.delegate    = self
        signUpVC.viewModel          = signUpViewModel
        navigation?.pushViewController(signUpVC, animated: true)
    }
    
    
}

extension MainCoordinator: PerfilLoginViewModelProtocol {
    func PerfilLoginViewModelDidFinish() {
        goToMain()
    }
    
}

extension MainCoordinator: PerfilSignUpViewModelDelegete {
    
    func PerfilSignUpViewModelDidFinish() {
        goToMain()
    }
    
}

extension MainCoordinator: LaunchScreenViewModelCoordinatorDelegate {
    
    func launchScreenCoordinatorGoToMainTabBar() {
        goToMain()
    }
    
}

extension MainCoordinator {
    fileprivate func goToMain() {
        DefaultsManager.instance.save(object: false, key: .isShowOnboarding)
        popNavivgation()
        startProcess(controller: .main)
    }
}
