//
//  MainCoordinator.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 20/03/21.
//

import UIKit


enum viewControllerType {
    case onboarding
    case splashscreen
    case main
    case login
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
        registerObserver()
    }
    
    fileprivate func registerObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.tappedLogout), name: Constants.ObserverNames.logoutUser, object: nil)
    }
    
    fileprivate func startProcess(controller: viewControllerType) {
        
        if controller == .onboarding || controller == .login {
            navigation = UINavigationController(rootViewController: getViewController(with: controller))
            window?.rootViewController = navigation
        } else {
            window?.rootViewController = getViewController(with: controller)
        }
        window?.makeKeyAndVisible()
        
    }
    
    func getViewController(with controller: viewControllerType) -> UIViewController {
        
        switch controller {
        case .login:
            let perfilChooseVC = PerfilChooseViewController()
            var perfilChooseViewModel = PerfilChooseViewModel()
            perfilChooseViewModel.delegate = self
            perfilChooseVC.viewModel = perfilChooseViewModel
            return perfilChooseVC
            
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
    
    @objc
    fileprivate func tappedLogout() {
        DefaultsManager.instance.delete(key: .userLogged)
        goToMain()
    }
}

extension MainCoordinator: OnBoardingCoordinatorDelagate, PerfilChooseCoordinatorProtocol {
    
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
        
        let settingsModel = CoreDataManager.shared.fetchData(Settings.self)
        let allowFceID = settingsModel.count == 0 ? false : settingsModel[0].allowFaceId
        
        if allowFceID {
            Authorize.WithTouchOrFace { isSucess in
                if isSucess { self.goToMain() }
            }
        } else { goToMain() }
        
    }
    
}

extension MainCoordinator {
    fileprivate func goToMain() {
        DefaultsManager.instance.save(object: false, key: .isShowOnboarding)
        popNavivgation()
        
        if let _: Data = DefaultsManager.instance.get(key: .userLogged) {
            startProcess(controller: .main)
        } else {
            startProcess(controller: .login)
        }
    }
}
