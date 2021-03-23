//
//  PerfilChooseViewController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 22/03/21.
//

import UIKit

class PerfilChooseViewController: UIViewController {

    var viewModel: PerfilChooseViewModel?
    
    let logo: UIImageView = {
        let logo = UIImageView(image: Constants.logoTipo)
        return logo
    }()
    
    let screenLabel: UILabel = {
        let label = UILabel()
        label.text      = "Bem-vindo ao iOSChat"
        label.textColor = AppColors.primaryColor()
        label.font      = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    lazy var loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.buildPrimaryButtonWithCorner("Log In")
        btn.addTapGesture {
            self.viewModel?.goToLogin()
        }
        return btn
    }()
    
    lazy var signUpButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.buildWhiteButtonWithCorner("Sign Up")
        btn.addTapGesture {
            self.viewModel?.goToSignUp()
        }
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    fileprivate func setupUI() {
        viewModel?.handleBackground(view)
        setupNavigationBar(isHidden: false, isTranslucent: false, title: "", backButtonIsHidden: true, backgroungColor: AppColors.backgroudSecundary() )
    }

    fileprivate func addViews() {
        
        view.addSubview(logo)
        view.addSubview(screenLabel)
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        
    }
    
    fileprivate func setupViews() {
        
        let sizeLogoTipo: CGFloat = view.frame.width * 0.4
        logo.applyViewConstraints( top: view.safeAreaLayoutGuide.topAnchor, centerX: view.centerXAnchor, size: .init(width: sizeLogoTipo, height: sizeLogoTipo), value: .init(top: 50, left: 0, bottom: 0, right: 0))
        
        screenLabel.applyViewConstraints(top: logo.bottomAnchor, centerX: view.centerXAnchor, size: .zero, value: .init(top: 30, left: 0, bottom: 0, right: 0))
        
        let widthButton: CGFloat = view.frame.width * 0.7
        loginButton.applyViewConstraints(top: screenLabel.bottomAnchor, centerX: view.centerXAnchor, size: .init(width: widthButton, height: 45), value: .init(top: 40, left: 0, bottom: 0, right: 0))
        signUpButton.applyViewConstraints(top: loginButton.bottomAnchor, centerX: view.centerXAnchor, size: .init(width: widthButton, height: 45), value: .init(top: 15, left: 0, bottom: 0, right: 0))
    }
    
}
