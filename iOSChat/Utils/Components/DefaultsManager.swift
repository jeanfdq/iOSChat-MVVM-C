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
    
    // MARK: Helpers
    
    fileprivate func standard() -> UserDefaults {
        return UserDefaults.standard
    }
    
    fileprivate func sync() {
        standard().synchronize()
    }
}
