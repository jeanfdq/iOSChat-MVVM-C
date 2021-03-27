//
//  PerfilLoginViewModel.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

protocol PerfilLoginViewModelProtocol: class {
    func PerfilLoginViewModelDidFinish()
}

struct PerfilLoginViewModel {
    
    var email:String = ""
    var password:String = ""
    
    weak var delegate: PerfilLoginViewModelProtocol?
    
    func handleBackground(_ view: UIView) {
        view.backgroundColor = .white
    }
    
    func login() -> Bool {
        
        let user = CoreDataManager.shared.fetchData(User.self, predicate: NSPredicate.buildPredicateWithUserEmail(email))
        
        if user.count > 0 {
            
            if user[0].userEmail == email && user[0].userPassword == password {
                
                DefaultsManager.instance.saveCurrentUser(data: UserModel(fullName: user[0].userFullName ?? "", phoneNumber: user[0].userCellPhone ?? "", email: user[0].userEmail ?? "").toData() ?? Data())
                
                return  true
                
            }
            
        }
        
        return false
        
    }
    
    func didFinish() {
        delegate?.PerfilLoginViewModelDidFinish()
    }
}
