//
//  PerfilSignUpViewController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

class PerfilSignUpViewController: UIViewController {

    var viewModel: PerfilSignUpViewModel?
    
    private lazy var fullName: BindingTextField = {
        let fullName = BindingTextField()
        fullName.buildWhite(placeHolder: "Full Name", capitalization: .words ,keyboard: .alphabet)
        fullName.bind { self.viewModel?.userFullName = $0 }
        return fullName
    }()
    
    private lazy var cellPhone: BindingTextField = {
        let cellPhone = BindingTextField()
        cellPhone.buildWhite(placeHolder: "Phone Number", keyboard: .phonePad)
        cellPhone.bind { self.viewModel?.userCellPhone = $0 }
        return cellPhone
    }()
    
    private lazy var email: BindingTextField = {
        let email = BindingTextField()
        email.buildWhite(placeHolder: "E-mail", keyboard: .emailAddress)
        email.bind { self.viewModel?.userEmail = $0 }
        return email
    }()
    
    private lazy var password: BindingTextField = {
        let password = BindingTextField()
        password.buildWhite(placeHolder: "Password", keyboard: .numberPad, isSecurity: true)
        password.bind { self.viewModel?.userPassword = $0 }
        return password
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.buildPrimaryButtonWithCorner("Sign Up")
        button.addTapGesture { [unowned self] in
            let isSignUp = self.viewModel?.signUp() ?? false
            if isSignUp {
                self.viewModel?.didFinished()
            } else {
                button.setShakeAnime()
            }
        }
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        addViews()
        setupContrantsViews()
        
    }
    
    fileprivate func setupUI() {
        viewModel?.handleBackground(view)
        setupNavigationBar(isHidden: false, isTranslucent: false, title: "Sign In", isLargeTitle: true, titleColor: .darkGray, backButtonIsHidden: false, backButtonTitle: "", backButtonColor: .darkGray, backgroungColor: .white, withShadow: false, animated: false)
    }
    
    fileprivate func addViews() {
        view.addSubview(fullName)
        view.addSubview(cellPhone)
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(signUpButton)
    }
    
    fileprivate func setupContrantsViews() {
        fullName.applyViewConstraints(top: view.safeAreaLayoutGuide.topAnchor, centerX: view.centerXAnchor, size: Constants.sizeFieldAndButton, value: .init(top: 40, left: 0, bottom: 0, right: 0))
        cellPhone.applyViewConstraints(top: fullName.bottomAnchor, centerX: view.centerXAnchor, size: Constants.sizeFieldAndButton, value: .init(top: 20, left: 0, bottom: 0, right: 0))
        email.applyViewConstraints(top: cellPhone.bottomAnchor, centerX: view.centerXAnchor, size: Constants.sizeFieldAndButton, value: .init(top: 20, left: 0, bottom: 0, right: 0))
        password.applyViewConstraints(top: email.bottomAnchor, centerX: view.centerXAnchor, size: Constants.sizeFieldAndButton, value: .init(top: 20, left: 0, bottom: 0, right: 0))
        signUpButton.applyViewConstraints(top: password.bottomAnchor, centerX: view.centerXAnchor, size: Constants.sizeFieldAndButton, value: .init(top: 20, left: 0, bottom: 0, right: 0))
    }

}
