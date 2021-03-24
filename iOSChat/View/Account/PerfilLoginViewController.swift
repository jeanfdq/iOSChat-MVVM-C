//
//  PerfilLoginViewController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

class PerfilLoginViewController: UIViewController {
    
    var viewModel: PerfilLoginViewModel?
    let fieldSize: CGSize = .init(width: UIScreen.main.bounds.width * 0.8, height: 42)
    
    private lazy var email: BindingTextField = {
        let email = BindingTextField()
        email.buildWhite(placeHolder: "E-mail", keyboard: .emailAddress)
        email.bind { self.viewModel?.email = $0 }
        return email
    }()
    
    private lazy var password: BindingTextField = {
        let password = BindingTextField()
        password.buildWhite(placeHolder: "Password", keyboard: .numberPad, isSecurity: true)
        password.bind { self.viewModel?.password = $0 }
        return password
    }()
    
    private let forgotPassword: UILabel = {
        let label = UILabel()
        label.text = "Esqueci minha senha?"
        label.textColor = AppColors.primaryColor()
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.buildPrimaryButtonWithCorner("Log In")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(forgotPassword)
        view.addSubview(loginButton)
        
        email.applyViewConstraints(top: view.safeAreaLayoutGuide.topAnchor, centerX: view.centerXAnchor, size: fieldSize, value: .init(top: 40, left: 0, bottom: 0, right: 0))
        password.applyViewConstraints(top: email.bottomAnchor, centerX: view.centerXAnchor, size: fieldSize, value: .init(top: 20, left: 0, bottom: 0, right: 0))
        forgotPassword.applyViewConstraints( top: password.bottomAnchor, trailing: password.trailingAnchor,  value: .init(top: 20, left: 0, bottom: 0, right: 0))
        loginButton.applyViewConstraints(top: forgotPassword.bottomAnchor, centerX: view.centerXAnchor, size: fieldSize, value: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    fileprivate func setupUI() {
        viewModel?.handleBackground(view)
        setupNavigationBar(isHidden: false, isTranslucent: false, title: "Log In", isLargeTitle: true, titleColor: .darkGray, backButtonIsHidden: false, backButtonTitle: "", backButtonColor: .darkGray, backgroungColor: .white, withShadow: false, animated: false)
    }
    
}
