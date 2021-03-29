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
    
    private var user: UserModel
    
    init(user: UserModel) {
        self.user = user
    }
    
    weak var delegate: PerfilViewModelCoordinatorProtocol?
    
    func handleBackgroud(_ view: UIView) {
        view.backgroundColor = .white
    }
    
    var userFullName: String {
        return user.fullName
    }
    
    var userEmail: String {
        return user.email
    }
    
    var userPhoto: UIImage {
        return user.photo.toImage ?? UIImage(systemName: "person.circle")?.withTintColor(.init(white: 0.8, alpha: 0.6)).withRenderingMode(.alwaysOriginal) ?? UIImage()
    }
    
    func udpateProfileImage(_ image: UIImage) {
        CoreDataManager.shared.udpateFieldData(email: userEmail, field: "userPhoto", value: image.jpegData(compressionQuality: 0.5)!)
        DefaultsManager.instance.renewCurrentUserOffLine(email: userEmail)
    }
    
    func goToDetails(){
        delegate?.goToDetails(userModel: user)
    }
    
    func goToSettings(){
        delegate?.goToSettings(userModel: user)
    }
    
    func logout() {
        delegate?.userLogout()
    }
    
}
