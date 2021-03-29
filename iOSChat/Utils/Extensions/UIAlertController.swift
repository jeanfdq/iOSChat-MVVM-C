//
//  UIAlertController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 28/03/21.
//

import UIKit

extension UIAlertController {
    
    var messageTitleTextColor: UIColor? {
        set{
            self.setValue(NSAttributedString(string: self.title ?? "", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor : UIColor.red]), forKey: "attributedTitle")
        } get {
            return self.value(forKey: "attributedTitle") as? UIColor
        }
    }
    
    var messageTextColor: UIColor? {
        set{
            self.setValue(NSAttributedString(string: self.message ?? "", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor : UIColor.red]), forKey: "attributedMessage")
        } get {
            return self.value(forKey: "attributedMessage") as? UIColor
        }
    }
    
}
