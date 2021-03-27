//
//  PerfilViewController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

class PerfilViewController: UIViewController {

    var viewModel: PerfilViewModel?
    
    let perfilImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "person.circle")?.withTintColor(.init(white: 0.8, alpha: 0.6)).withRenderingMode(.alwaysOriginal)
        image.setCorner(radius: 60)
        return image
    }()
    
    lazy var userFullName: UILabel = {
        let name = UILabel()
        name.text = viewModel?.userFullName
        name.textColor = .darkGray
        name.font = .systemFont(ofSize: 18, weight: .semibold)
        return name
    }()
    
    lazy var logoutButton: UIButton = {
       let button = UIButton()
        button.buildWhiteButtonWithCorner("logout")
        button.addTapGesture { [unowned self] in
            self.viewModel?.logout()
        }
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewModel?.handleBackgroud(view)
        viewModel?.currentUserData()
        
        setupNavigationBar(isHidden: false, isTranslucent: false, title: Constants.TabBar.TabBarTitle.perfil.rawValue, titleColor: .black, backgroungColor: .white, withShadow: true)

        view.addSubview(perfilImage)
        view.addSubview(userFullName)
        view.addSubview(logoutButton)
        
        perfilImage.applyViewConstraints(top: view.safeAreaLayoutGuide.topAnchor, centerX: view.centerXAnchor, size: .init(width: 120, height: 120), value: .init(top: 20, left: 0, bottom: 0, right: 0))
        userFullName.applyViewConstraints(top: perfilImage.bottomAnchor, centerX: perfilImage.centerXAnchor, value: .init(top: 20, left: 0, bottom: 0, right: 0))
        logoutButton.applyViewConstraints(top: userFullName.bottomAnchor, centerX: userFullName.centerXAnchor, size: Constants.sizeFieldAndButton, value: .init(top: 20, left: 0, bottom: 0, right: 0))
        
    }
}
