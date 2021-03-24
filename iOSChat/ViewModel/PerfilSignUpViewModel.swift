//
//  PerfilSignUpViewModel.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 24/03/21.
//

import UIKit

struct PerfilSignUpViewModel {
    
    var userFullName: String = ""
    var userCellPhone: String = ""
    var userEmail: String = ""
    var userPassword: String = ""
    
    func handleBackground(_ view: UIView) {
        view.backgroundColor = .white
    }
}
