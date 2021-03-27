//
//  PerfilViewModel.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

protocol PerfilViewModelCoordinatorProtocol: class {
    func goToDetails(userModel: UserModel)
    func goToSettings(userModel: UserModel)
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
    
    var userEmail: String {
        return userModel?.email ?? ""
    }
    
    var userPhoto: UIImage {
        return userModel?.photo.toImage ?? UIImage(systemName: "person.circle")?.withTintColor(.init(white: 0.8, alpha: 0.6)).withRenderingMode(.alwaysOriginal) ?? UIImage()
    }
    
    func udpateProfileImage(_ image: UIImage) -> Bool {
        return CoreDataManager.shared.udpateFieldData(email: userEmail, field: "userPhoto", value: image.jpegData(compressionQuality: 0.5)!)
    }
    
    func goToDetails(){
        guard let userModel = userModel else {return}
        delegate?.goToDetails(userModel: userModel)
    }
    
    func goToSettings(){
        guard let userModel = userModel else {return}
        delegate?.goToSettings(userModel: userModel)
    }
    
    func logout() {
        delegate?.userLogout()
    }
    
}
