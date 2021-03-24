//
//  UITextField.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 23/03/21.
//

import UIKit

extension UITextField {
    
    func buildWhite( placeHolder: String, capitalization: UITextAutocapitalizationType = .none, keyboard: UIKeyboardType, isSecurity:Bool = false) {
        isSecureTextEntry = isSecurity
        autocapitalizationType = capitalization
        keyboardType = keyboard
        font = .systemFont(ofSize: 16, weight: .regular)
        textColor = .darkGray
        setBorder(.lightGray, 0.5)
        setCorner(radius: 15)
        let attPlaceholder = NSMutableAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(white: 0.7, alpha: 1)])
        attributedPlaceholder = attPlaceholder
        paddingLeft(value: 10)
    }
    
    
    func paddingLeft(value:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: frame.height))
        leftView = paddingView
        leftViewMode = .always
    }
    
    func paddingRight(value:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: frame.height))
        rightView = paddingView
        rightViewMode = .always
    }
}
