//
//  Constants.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

struct Constants {
    
    static let logoTipo = UIImage(named: "chatIcon")
    
    struct TabBar {
        
        static let tintColor = UIColor.white
        static let tabColorSelected = AppColors.primaryColor()
        static let tabColorUnSelected = AppColors.tabBarUnselected()
        
        enum TabBarTitle: String {
            case home = "Chats"
            case contacts = "Contatos"
            case perfil = "Perfil"
        }
        
        enum TabBarImage: String {
            
            case home = "message.fill"
            case contacts = "person.2.fill"
            case perfil = "person.fill"
        }
        
    }
    
    enum DefaultsManagerKeys: String {
        case userLogged = "userLogged"
    }
    
}
