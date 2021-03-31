//
//  ContactsViewModel.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 29/03/21.
//

import Foundation

protocol ContactsViewModelProtocol: class {
    func openChat(userDestination: UserModel)
}

class ContactsViewModel {
    
    var user: UserModel
    
    weak var delegate: ContactsViewModelProtocol?
    
    init(_ user: UserModel) {
        self.user = user
    }
    
    func getListOfUsers() -> [UserModel] {
        
        var listOfUsers = [UserModel]()
        
        let users = CoreDataManager.shared.fetchData(User.self, predicate: NSPredicate(format: "userEmail != %@", "\(user.email)"))
        for user in users {
            listOfUsers.append(UserModel(fullName: user.userFullName ?? "", phoneNumber: user.userCellPhone ?? "", email: user.userEmail ?? "", photo: user.userPhoto ?? Data()))
        }
        
        return listOfUsers.sorted(by: { $0.fullName < $1.fullName })
        
    }
    
}
