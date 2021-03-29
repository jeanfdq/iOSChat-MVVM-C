//
//  DefaultsManager.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

extension UserDefaults {

    subscript<T>(key: String) -> T? {
        get {
            return value(forKey: key) as? T
        }
        set {
            set(newValue, forKey: key)
        }
    }
}

class DefaultsManager {
    
     static let instance = DefaultsManager()
    
//    class func shared() -> DefaultsManager {
//        return instance
//    }
    
    // MARK: Manager
    
    func save<T>(object: T, key: Constants.DefaultsManagerKeys) {
        standard()[key.rawValue] = object
        sync()
    }
    
    func get<T>(key: Constants.DefaultsManagerKeys) -> T? {
        return standard()[key.rawValue]
    }
    
    func delete(key: Constants.DefaultsManagerKeys) {
        standard().removeObject(forKey: key.rawValue)
        sync()
    }
    
    func saveCurrentUser( data: Data) {
        delete(key: .userLogged)
        save(object: data, key: .userLogged)
    }
    
    func currentUserData() -> UserModel {
        if let userModelData: Data? = get(key: .userLogged) {
            return userModelData?.toModel() ?? UserModel()
        }
        return UserModel()
    }
    
    func renewCurrentUserOffLine(email: String) {
        let userCoreData = CoreDataManager.shared.fetchData(User.self, predicate: NSPredicate.buildPredicateWithUserEmail(email))
        DefaultsManager.instance.delete(key: .userLogged)
        
        guard let fullName = userCoreData[0].userFullName,
              let phoneNumber = userCoreData[0].userCellPhone,
              let email = userCoreData[0].userEmail,
              let photo = userCoreData[0].userPhoto
        else {return}
        
        let newUser = UserModel(fullName: fullName, phoneNumber: phoneNumber, email: email, photo: photo)
        
        DefaultsManager.instance.saveCurrentUser(data: newUser.toData() ?? Data())
    }
    
    // MARK: Helpers
    
    fileprivate func standard() -> UserDefaults {
        return UserDefaults.standard
    }
    
    fileprivate func sync() {
        standard().synchronize()
    }
}
