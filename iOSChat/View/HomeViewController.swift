//
//  HomeViewController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 20/03/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupNavigationBar(isHidden: false, isTranslucent: false, title: Constants.TabBar.TabBarTitle.home.rawValue, titleColor: .black, backgroungColor: .white, withShadow: true)
    }

}
