//
//  PerfilLoginViewController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

class PerfilLoginViewController: UIViewController {
    
    var viewModel: PerfilLoginViewModel?
    
    let logo: UIImageView = {
        let logo = UIImageView(image: Constants.logoTipo)
        return logo
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        addViews()
        setupViews()
    }
    
    fileprivate func setupUI() {
        viewModel?.handleBackground(view)
        setupNavigationBar(isHidden: false, isTranslucent: false, title: "Login", titleColor: .black, backButtonIsHidden: true, backgroungColor: .white, withShadow: true, animated: false)
    }
    
    fileprivate func addViews() {
        
        view.addSubview(logo)
        
    }
    
    fileprivate func setupViews() {
        
        let sizeLogoTipo: CGFloat = view.frame.width * 0.4
        logo.applyViewConstraints( top: view.safeAreaLayoutGuide.topAnchor, centerX: view.centerXAnchor, size: .init(width: sizeLogoTipo, height: sizeLogoTipo), value: .init(top: 50, left: 0, bottom: 0, right: 0))
        
    }

}
