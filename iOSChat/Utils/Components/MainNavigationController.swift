//
//  MainNavigationController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 27/03/21.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    
    convenience init(navbarHidden:Bool = false, largeTitle:Bool = false, title: String = "", backButtonHidden: Bool = true) {
        self.init()
        setupNavigationBar(isHidden: navbarHidden, isTranslucent: false, title: title, isLargeTitle: largeTitle, titleColor: .darkGray, backButtonIsHidden: backButtonHidden, backButtonTitle: "", backButtonColor: .darkGray, backgroungColor: .white, withShadow: true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    

}
