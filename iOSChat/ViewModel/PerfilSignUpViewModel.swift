//
//  PerfilSignUpViewModel.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 24/03/21.
//

import UIKit

protocol PerfilSignUpViewModelDelegete: class {
    func PerfilSignUpViewModelDidFinish()
}

struct PerfilSignUpViewModel {
    
    weak var delegate: PerfilSignUpViewModelDelegete?
    
    var userFullName: String = ""
    var userCellPhone: String = ""
    var userEmail: String = ""
    var userPassword: String = ""
    
    func handleBackground(_ view: UIView) {
        view.backgroundColor = .white
    }
    
    
    
    func signUp() -> Bool {
        
        if  validForm() {
            
            let (context,user) = CoreDataManager.shared.create(User.self)
            user?.userFullName  = userFullName
            user?.userCellPhone = userCellPhone
            user?.userEmail     = userEmail
            user?.userPassword  = userPassword
            
            if CoreDataManager.shared.save(context: context) {
                DefaultsManager.instance.saveCurrentUser(data: UserModel(fullName: userFullName, phoneNumber: userCellPhone, email: userEmail, photo: Data()).toData() ?? Data())
                return true
            }
            return false
            
        }
        return false
        
    }
    
    func didFinished() {
        delegate?.PerfilSignUpViewModelDidFinish()
    }
    
    fileprivate func validForm() -> Bool {
        var sucess = true
        
        if userFullName.isEmpty || userFullName.count <= 2{
            sucess = false
        }
        
        if userCellPhone.count < 11 {
            sucess = false
        }
        
        if !userEmail.isValidEmail {
            sucess = false
        }
        
        if userPassword.count != 6 {
            sucess = false
        }
        
        return sucess
    }
    
}
