//
//  PerfilViewModel.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

protocol PerfilViewModelCoordinatorProtocol: class {
    func userLogout()
}

struct PerfilViewModel {
    
    private var userModel: UserModel?
    
    weak var delegate: PerfilViewModelCoordinatorProtocol?
    
    func handleBackgroud(_ view: UIView) {
        view.backgroundColor = .white
    }
    
    mutating func currentUserData() {
        if let userModelData: Data? = DefaultsManager.instance.get(key: .userLogged) {
            userModel = userModelData?.toModel()
        }
    }
    
    var userFullName: String {
        return userModel?.fullName ?? ""
    }
    
    func logout() {
        delegate?.userLogout()
    }
    
}
