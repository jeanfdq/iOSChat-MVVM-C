//
//  UIViewController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 20/03/21.
//

import UIKit

extension UIViewController {
    
    var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
    
    func setupNavigationBar(isHidden: Bool = false, isTranslucent: Bool = false, title: String = "", isLargeTitle: Bool = false, titleColor: UIColor = .red, backButtonIsHidden: Bool = false, backButtonTitle: String = "", backButtonColor: UIColor = .systemBlue, backgroungColor: UIColor = .white, withShadow: Bool = false, animated: Bool = false) {
        
        self.navigationController?.navigationBar.isHidden = isHidden
        self.navigationItem.title = title
        self.navigationController?.navigationBar.prefersLargeTitles = isLargeTitle
        self.navigationController?.navigationBar.sizeToFit()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:titleColor]
        self.navigationController?.navigationBar.barTintColor = backgroungColor
        self.navigationController?.navigationBar.isTranslucent = isTranslucent
        
        self.navigationItem.hidesBackButton = backButtonIsHidden
        self.navigationController?.navigationBar.tintColor = backButtonColor
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: backButtonTitle, style: .plain, target: nil, action: nil)
        
        if #available(iOS 13.0, *) {
            if isLargeTitle {
                let nav = UINavigationBarAppearance()
                nav.backgroundColor = backgroungColor
                nav.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:titleColor]
                
                navigationController?.navigationBar.standardAppearance = nav
                navigationController?.navigationBar.scrollEdgeAppearance = nav
            }
        }
        
        if isTranslucent {
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.view.backgroundColor = backgroungColor
        }
        
        if withShadow {
            self.navigationController?.navigationBar.layer.masksToBounds = false
            self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
            self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
            self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            self.navigationController?.navigationBar.layer.shadowRadius = 2
        } else {
            self.navigationController?.navigationBar.layer.shadowColor = UIColor.clear.cgColor
            self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
        
    }
    
    typealias tupleImages = (UIImage?,UIImage?)
    
    func setTemplateNavigationController(_ nav: UINavigationController, _ tupleImages:tupleImages) {
        nav.tabBarItem.image = tupleImages.0?.withTintColor(.black).withRenderingMode(.alwaysOriginal)
        nav.tabBarItem.selectedImage = tupleImages.1?.withTintColor(.black).withRenderingMode(.alwaysOriginal)
    }
    
    func insertBlurBackground(style: UIBlurEffect.Style) {
        
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
    }
    
    func addViewCenterInto(_ viewObj:UIView, size:CGSize = .zero) {
        view.addSubview(viewObj)
        viewObj.applyCenterIntoSuperView(size: size)
    }
    
}
