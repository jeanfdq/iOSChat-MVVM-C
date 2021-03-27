//
//  OnboardingCoordinator.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 22/03/21.
//

import UIKit
import CoreData

protocol OnboardingCoordinatorDelegate: class {
    func onboardingDidFinish()
}

class OnboardingCoordinator: NSObject, Coordinator {
    
    var childCoordinator = CoordinatorStack<Coordinator>()
    
    var navigationController: UINavigationController
    
    weak var coordinatorDelegate: OnboardingCoordinatorDelegate?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let vc = OnBoardingViewController(collectionViewLayout: UICollectionViewFlowLayout())
        vc.delegate = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func pop(){
        navigationController.popViewController(animated: true)
        navigationController.dismiss(animated: true)
    }
    
}

extension OnboardingCoordinator: OnBoardingCoordinatorDelagate {
    
    func goToLogin() {
        
        let vc = PerfilLoginViewController()
        var vm = PerfilLoginViewModel()
        vm.delegate = self
        vc.viewModel = vm
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToSignUp() {
        
        let vc = PerfilSignUpViewController()
        var vm = PerfilSignUpViewModel()
        vm.delegate = self
        vc.viewModel = vm
        navigationController.pushViewController(vc, animated: true)
        
    }
}

extension OnboardingCoordinator: PerfilLoginViewModelProtocol {
    
    func PerfilLoginViewModelDidFinish() {
        pop()
        coordinatorDelegate?.onboardingDidFinish()
    }
    
}

extension OnboardingCoordinator: PerfilSignUpViewModelDelegete {
    
    func PerfilSignUpViewModelDidFinish() {
        pop()
        coordinatorDelegate?.onboardingDidFinish()
    }
    
}
