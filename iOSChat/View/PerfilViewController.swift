//
//  PerfilViewController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

fileprivate enum typeOfChoosePhoto{
    case library
    case camera
}

class PerfilViewController: UIViewController {

    var viewModel: PerfilViewModel?
    var pickerView = PickerView()
    
    lazy var perfilImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = viewModel?.userPhoto
        image.setCorner(radius: 60)
        image.isUserInteractionEnabled = true
        image.addTapGesture { [weak self] in
            self?.choosePhoto()
        }
        return image
    }()
    
    lazy var userFullName: UILabel = {
        let name = UILabel()
        name.text = viewModel?.userFullName
        name.textColor = .darkGray
        name.font = .systemFont(ofSize: 18, weight: .semibold)
        return name
    }()
    
    lazy var containerUserDetails: UIView = {
        let container = UIView()
        container.isUserInteractionEnabled = true
        
        let icon = UIImageView(image: UIImage(systemName: "person.circle")?.withRenderingMode(.alwaysTemplate))
        
        let iconDescription = UILabel()
        iconDescription.text = "Detalhes da Conta"
        iconDescription.textColor = .darkGray
        iconDescription.font = .systemFont(ofSize: 14, weight: .semibold)
        
        let iconGo = UIImageView(image: UIImage(systemName: "chevron.forward")?.withTintColor(.init(white: 0.8, alpha: 0.7), renderingMode: .alwaysOriginal))
        
        container.addSubViews(icon, iconDescription, iconGo)
        
        icon.applyViewConstraints(leading: container.leadingAnchor, centerY: container.centerYAnchor, size: .init(width: 26, height: 26), value: .init(top: 0, left: 10, bottom: 0, right: 0))
        iconDescription.applyViewConstraints(leading: icon.trailingAnchor, centerY: container.centerYAnchor, value: .init(top: 0, left: 10, bottom: 0, right: 0))
        iconGo.applyViewConstraints(trailing: container.trailingAnchor, centerY: container.centerYAnchor, size: .init(width: 16, height: 16), value: .init(top: 0, left: 0, bottom: 0, right: 10))
        
        container.addTapGesture {
            self.viewModel?.goToDetails()
        }
        return container
    }()
    
    lazy var containerUserSettings: UIView = {
        let container = UIView()
        container.isUserInteractionEnabled = true
        
        let icon = UIImageView(image: UIImage(systemName: "gearshape")?.withTintColor(.darkGray, renderingMode: .alwaysOriginal))
        
        let iconDescription = UILabel()
        iconDescription.text = "Configurações"
        iconDescription.textColor = .darkGray
        iconDescription.font = .systemFont(ofSize: 14, weight: .semibold)
        
        let iconGo = UIImageView(image: UIImage(systemName: "chevron.forward")?.withTintColor(.init(white: 0.8, alpha: 0.7), renderingMode: .alwaysOriginal))
        
        container.addSubViews(icon, iconDescription, iconGo)
        
        icon.applyViewConstraints(leading: container.leadingAnchor, centerY: container.centerYAnchor, size: .init(width: 26, height: 26), value: .init(top: 0, left: 10, bottom: 0, right: 0))
        iconDescription.applyViewConstraints(leading: icon.trailingAnchor, centerY: container.centerYAnchor, value: .init(top: 0, left: 10, bottom: 0, right: 0))
        iconGo.applyViewConstraints(trailing: container.trailingAnchor, centerY: container.centerYAnchor, size: .init(width: 16, height: 16), value: .init(top: 0, left: 0, bottom: 0, right: 10))
        
        container.addTapGesture {
            self.viewModel?.goToSettings()
        }
        return container
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
        
        setupView()
        setupSubViews()
        
        pickerView.pickerViewDelegate = self
    }
    
    fileprivate func setupView() {
        viewModel?.handleBackgroud(view)
        
        setupNavigationBar(isHidden: false, isTranslucent: false, title: Constants.TabBar.TabBarTitle.perfil.rawValue, titleColor: .black, backgroungColor: .white, withShadow: true)
    }
    
    fileprivate func setupSubViews() {
        
        view.addSubview(perfilImage)
        perfilImage.applyViewConstraints(top: view.safeAreaLayoutGuide.topAnchor, centerX: view.centerXAnchor, size: .init(width: 120, height: 120), value: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        view.addSubview(userFullName)
        userFullName.applyViewConstraints(top: perfilImage.bottomAnchor, centerX: perfilImage.centerXAnchor, value: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        view.addSubview(containerUserDetails)
        view.addSubview(containerUserSettings)
        let sizeContainer: CGSize = .init(width: view.frame.size.width * 0.9, height: 60)
        containerUserDetails.applyViewConstraints(top: userFullName.bottomAnchor, centerX: view.centerXAnchor, size: sizeContainer, value: .init(top: 30, left: 0, bottom: 0, right: 0))
        containerUserSettings.applyViewConstraints(top: containerUserDetails.bottomAnchor, centerX: view.centerXAnchor, size: sizeContainer)
        
        view.addSubview(logoutButton)
        logoutButton.applyViewConstraints(top: containerUserSettings.bottomAnchor, centerX: userFullName.centerXAnchor, size: Constants.sizeFieldAndButton, value: .init(top: 30, left: 0, bottom: 0, right: 0))
        
    }
    
    fileprivate func choosePhoto(){
        let alertChoose = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "cancel", style: .cancel)
        cancel.titleTextColor = .red
        
        alertChoose.addAction(.setAction(title: "camera", foreColor: AppColors.primaryColor()) { [weak self] _ in
            self?.pickerViewControl(type: .camera)
        })
        alertChoose.addAction(.setAction(title: "library", foreColor: AppColors.primaryColor()){ [weak self] _ in
            self?.pickerViewControl(type: .library)
        })
        alertChoose.addAction(cancel)
        
        self.present(alertChoose, animated: true)
    }
    
    fileprivate func pickerViewControl(type: typeOfChoosePhoto) {
        
        let addPhoto = UIImagePickerController()
        addPhoto.delegate = pickerView
        
        if type == .camera && UIImagePickerController.isSourceTypeAvailable(.camera) {
            addPhoto.sourceType = .camera
        }else{
            addPhoto.sourceType = .photoLibrary
        }
        
        self.present(addPhoto, animated: true, completion: nil)
        
    }
}

extension PerfilViewController:getPhotoFromPickerViewProtocol{
    
    func getPhoto(_ imagePickerView: UIImage) {
        perfilImage.image = imagePickerView
        viewModel?.udpateProfileImage(imagePickerView)
    }
    
}
