//
//  PerfilSettingsViewModel.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 27/03/21.
//

import UIKit

class PerfilSettingsViewModel {
    
    var user: UserModel
    
    init(user: UserModel) {
        self.user = user
    }
    
    func handleBackground(view: UIView) {
        view.backgroundColor = .init(white: 0.95, alpha: 1)
    }
    
    @objc
    func tappedDone() {
        debugPrint(#function)
    }
    
}
