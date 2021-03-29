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
    
    var allowPushNotifications: Bool {
        let (push , _ ) = getSettingData()
        return push
    }
    
    var allowFaceID: Bool {
        let (_ , faseID ) = getSettingData()
        return faseID
    }
    
    fileprivate func getSettingData() -> (Bool, Bool) {
        
        let settings = CoreDataManager.shared.fetchData(Settings.self)
        if settings.count > 0 {
            return (settings.last?.allowNotification ?? false, settings.last?.allowFaceId ?? false)
        }else {
            let (context,settings) = CoreDataManager.shared.create(Settings.self)
            settings?.allowFaceId = false
            settings?.allowNotification = false
            CoreDataManager.shared.save(context: context)
            return (false, false)
        }
        
    }
    
    @objc
    func togglePush(send: UISwitch) {
        CoreDataManager.shared.udpateFieldSettingsBool(field: .pushNotification, value: send.isOn)
    }
    
    @objc
    func toggleFaceID(send: UISwitch) {
        CoreDataManager.shared.udpateFieldSettingsBool(field: .faceID, value: send.isOn)
    }
    
}
