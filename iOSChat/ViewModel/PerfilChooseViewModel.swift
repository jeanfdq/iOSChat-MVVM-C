//
//  PerfilChooseViewModel.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 22/03/21.
//

import UIKit

protocol PerfilChooseCoordinatorProtocol: class {
    func goToSignUp()
    func goToLogin()
}

struct PerfilChooseViewModel {
    
    weak var delegate: PerfilChooseCoordinatorProtocol?
    
    func handleBackground(_ view: UIView) {
        view.backgroundColor = AppColors.backgroudSecundary()
    }
    
    func goToLogin(){
        delegate?.goToLogin()
    }
    
    func goToSignUp() {
        delegate?.goToSignUp()
    }
    
}
