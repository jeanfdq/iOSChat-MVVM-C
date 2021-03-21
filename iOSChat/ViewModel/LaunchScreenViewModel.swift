//
//  LaunchScreenViewModel.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 20/03/21.
//

import UIKit

protocol LaunchScreenViewModelCoordinatorDelegate: class {
    func launchScreenCoordinatorGoToMainTabBar()
}

class LaunchScreenViewModel: NSObject {
    
    weak var coordinator: LaunchScreenViewModelCoordinatorDelegate?
    
    func handleBackground(_ view:UIView) {
        view.backgroundColor = AppColors.backgroudSecundary()
    }
    
    func inicializeSplash(){
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.coordinator?.launchScreenCoordinatorGoToMainTabBar()
        }
        
    }
    
}
