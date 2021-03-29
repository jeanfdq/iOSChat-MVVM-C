//
//  UIAlertAction.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 27/03/21.
//

import UIKit

extension UIAlertAction {
    
    static func setAction( title:String?, foreColor: UIColor = AppColors.primaryColor(), _ handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        let action = UIAlertAction(title: title, style: .default, handler: handler)
        action.titleTextColor = foreColor
        return action
    }
    
    var titleTextColor: UIColor? {
        get {
            return self.value(forKey: "titleTextColor") as? UIColor
        } set {
            self.setValue(newValue, forKey: "titleTextColor")
        }
    }
    
}
