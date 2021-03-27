//
//  UIAlertAction.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 27/03/21.
//

import UIKit

extension UIAlertAction {
    
    static func setAction(_ title:String?, _ handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        return UIAlertAction(title: title, style: .default, handler: handler)
    }
    
    static func setCancel(_ title:String?, _ handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        return UIAlertAction(title: title, style: .cancel, handler: handler)
    }
    
    func setTitleColor(color:UIColor){
        self.setValue(color, forKey: "titleTextColor")
    }
}

