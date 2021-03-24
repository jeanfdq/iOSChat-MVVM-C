//
//  PerfilViewModel.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

protocol PerfilViewModelCoordinatorProtocol: class {

}

struct PerfilViewModel {
    
    weak var delegate: PerfilViewModelCoordinatorProtocol?
    
    func handleBackgroud(_ view: UIView) {
        view.backgroundColor = .red
    }
    
    func verifyUserLogged() {
        
        let isLogged:Bool? = DefaultsManager.instance.get(key: .userLogged) ?? false
        
        
    }
    
}
