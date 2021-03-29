//
//  PerfilDetailsViewController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 27/03/21.
//

import UIKit

class PerfilDetailsViewController: UIViewController {

    var viewModel: PerfilDetailsViewModel?
    
    
    var newFullName: UITextField = {
        let txf = UITextField()
        return txf
    }()
    
    var newEmail: UITextField = {
        let txf = UITextField()
        return txf
    }()
    
    var newPhoneNumber: UITextField = {
        let txf = UITextField()
        return txf
    }()
    
    let publicProfileLabel: UILabel = {
        let label = UILabel()
        label.text = "PUBLIC PROFILE"
        label.textColor = .darkGray
        label.font      = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    lazy var containerFullName: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.isUserInteractionEnabled = true
        
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Full Name"
        fullNameLabel.textColor = .black
        fullNameLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        let userFullName = UILabel()
        userFullName.textAlignment = .right
        userFullName.text = viewModel?.fullName
        userFullName.textColor = .black
        userFullName.font = .systemFont(ofSize: 14, weight: .semibold)
        
        
        container.addSubViews(fullNameLabel, userFullName)
        fullNameLabel.applyViewConstraints(leading: container.leadingAnchor, centerY: container.centerYAnchor, value: .init(top: 0, left: 10, bottom: 0, right: 0))
        userFullName.applyViewConstraints( trailing: container.trailingAnchor, centerY: container.centerYAnchor, value: .init(top: 0, left: 0, bottom: 0, right: 10))
        
        container.addTapGesture { [unowned self] in
            self.newFullName = self.buildAlertInputData("Atualize seu nome", "") { _ in
                userFullName.text = self.newFullName.text
            }
        }
        
        return container
    }()
    
    let privateProfileLabel: UILabel = {
        let label = UILabel()
        label.text = "PRIVATE PROFILE"
        label.textColor = .darkGray
        label.font      = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    lazy var containerEmail: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.isUserInteractionEnabled = true
        
        let emailLabel = UILabel()
        emailLabel.text = "E-mail"
        emailLabel.textColor = .black
        emailLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        let userEmail = UILabel()
        userEmail.textAlignment = .right
        userEmail.text = viewModel?.email
        userEmail.textColor = .black
        userEmail.font = .systemFont(ofSize: 14, weight: .semibold)
        
        
        container.addSubViews(emailLabel, userEmail)
        emailLabel.applyViewConstraints(leading: container.leadingAnchor, centerY: container.centerYAnchor, value: .init(top: 0, left: 10, bottom: 0, right: 0))
        userEmail.applyViewConstraints( trailing: container.trailingAnchor, centerY: container.centerYAnchor, value: .init(top: 0, left: 0, bottom: 0, right: 10))
        
        container.addTapGesture { [unowned self] in
            self.newEmail = self.buildAlertInputData("Atualize seu e-mail", "") { _ in
                userEmail.text = self.newEmail.text
            }
        }
        
        return container
    }()
    
    lazy var containerPhone: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.isUserInteractionEnabled = true
        
        let phoneLabel = UILabel()
        phoneLabel.text = "CellPhone"
        phoneLabel.textColor = .black
        phoneLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        let userPhone = UILabel()
        userPhone.textAlignment = .right
        userPhone.text = viewModel?.phone
        userPhone.textColor = .black
        userPhone.font = .systemFont(ofSize: 14, weight: .semibold)
        
        
        container.addSubViews(phoneLabel, userPhone)
        phoneLabel.applyViewConstraints(leading: container.leadingAnchor, centerY: container.centerYAnchor, value: .init(top: 0, left: 10, bottom: 0, right: 0))
        userPhone.applyViewConstraints( trailing: container.trailingAnchor, centerY: container.centerYAnchor, value: .init(top: 0, left: 0, bottom: 0, right: 10))
        
        container.addTapGesture { [unowned self] in
            self.newPhoneNumber = self.buildAlertInputData("Atualize seu nro de celular", "") { _ in
                if self.newPhoneNumber.text?.count == 11 {
                    userPhone.text = self.newPhoneNumber.text?.applyPatternOnNumbers(pattern: "(##) # ####-####", replacmentCharacter: "#")
                }
                
            }
        }
        
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addPublicProfile()
        addPrivateProfile()
    }
    
    fileprivate func setupView() {
        viewModel?.handleBackground(view: view)
        
        setupNavigationBar(isHidden: false, isTranslucent: false, title: "Edit Profile", isLargeTitle: false, titleColor: .darkGray, backButtonIsHidden: false, backButtonTitle: "", backButtonColor: AppColors.primaryColor(), backgroungColor: .white, withShadow: true, animated: true)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.updateFields))
    }
    
    fileprivate func addPublicProfile() {
        view.addSubview(publicProfileLabel)
        view.addSubview(containerFullName)
        
        
        publicProfileLabel.applyViewConstraints(leading: view.leadingAnchor, top: view.safeAreaLayoutGuide.topAnchor, value: .init(top: 40, left: 10, bottom: 0, right: 0))
        containerFullName.applyViewConstraints(leading: view.leadingAnchor, top: publicProfileLabel.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: 0, height: 40), value: .init(top: 5, left: 0, bottom: 0, right: 0))
    }
    
    fileprivate func addPrivateProfile() {
        view.addSubview(privateProfileLabel)
        view.addSubview(containerEmail)
        view.addSubview(containerPhone)
        
        privateProfileLabel.applyViewConstraints(leading: view.leadingAnchor, top: containerFullName.bottomAnchor, value: .init(top: 40, left: 10, bottom: 0, right: 0))
        containerEmail.applyViewConstraints(leading: view.leadingAnchor, top: privateProfileLabel.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: 0, height: 40), value: .init(top: 5, left: 0, bottom: 0, right: 0))
        containerPhone.applyViewConstraints(leading: view.leadingAnchor, top: containerEmail.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: 0, height: 40), value: .init(top: 2, left: 0, bottom: 0, right: 0))
    }
    
    @objc
    fileprivate func updateFields() {
        viewModel?.updateField(on: .fullName, value: newFullName.text)
        viewModel?.updateField(on: .emailAddress, value: newEmail.text)
        viewModel?.updateField(on: .phoneNumbew, value: newPhoneNumber.text)
    }
    
    
}
