//
//  PerfilLoginViewModel.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

protocol PerfilLoginViewModelProtocol: class {
    func goToSignUp()
}

struct PerfilLoginViewModel {
    
    weak var delegate: PerfilLoginViewModelProtocol?
    
    func handleBackground(_ view: UIView) {
        view.backgroundColor = AppColors.backgroudSecundary()
    }
    
    func goToSignUp() {
        delegate?.goToSignUp()
    }
}
