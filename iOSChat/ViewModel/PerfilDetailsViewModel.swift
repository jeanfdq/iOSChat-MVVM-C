//
//  PerfilDetailsViewModel.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 27/03/21.
//

import UIKit

enum updateFieldType {
    case fullName
    case emailAddress
    case phoneNumbew
}

protocol PerfilDetailsViewModelProtocol: class {
    func PerfilDetailsViewModelDidFinished()
}

class PerfilDetailsViewModel {
    
    var user: UserModel
    weak var delegate: PerfilDetailsViewModelProtocol?
    
    init(user: UserModel) {
        self.user = user
    }
    
    func handleBackground(view: UIView) {
        view.backgroundColor = .init(white: 0.95, alpha: 1)
    }
    
    var fullName: String {
        return user.fullName
    }
    
    var email: String {
        return user.email
    }
    
    var phone: String {
        let phone = user.phoneNumber
        return phone.applyPatternOnNumbers(pattern: "(##) # ####-####", replacmentCharacter: "#")
    }
    
    
    func updateField(on field: updateFieldType, value: String?) {
        
        guard let value = value, !value.isEmpty else {return}
        
        switch field {
        case .fullName:CoreDataManager.shared.udpateFieldString(email: user.email, field: "userFullName", value: value)
        case .emailAddress: CoreDataManager.shared.udpateFieldString(email: user.email, field: "userEmail", value: value)
        case .phoneNumbew: CoreDataManager.shared.udpateFieldString(email: user.email, field: "userCellPhone", value: value)
        }
        
        user.email = field == .emailAddress ? value: user.email
        DefaultsManager.instance.renewCurrentUserOffLine(email: email)
        
        delegate?.PerfilDetailsViewModelDidFinished()
    }
    
}
