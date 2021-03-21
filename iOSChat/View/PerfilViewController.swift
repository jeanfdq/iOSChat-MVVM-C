//
//  PerfilViewController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

class PerfilViewController: UIViewController {

    var viewModel: PerfilViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.handleBackgroud(view)
        setupNavigationBar(isHidden: false, isTranslucent: false, title: Constants.TabBar.TabBarTitle.perfil.rawValue, titleColor: .black, backgroungColor: .white, withShadow: true)
        
        viewModel?.verifyUserLogged()
        
    }

}
