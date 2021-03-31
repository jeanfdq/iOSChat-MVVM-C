//
//  PerfilSettingViewController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 27/03/21.
//

import UIKit

class PerfilSettingsViewController: UIViewController {

    var viewModel: PerfilSettingsViewModel?
    
    let generalProfileLabel: UILabel = {
        let label = UILabel()
        label.text = "GENERAL"
        label.textColor = .darkGray
        label.font      = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    lazy var containerPushNotification: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.isUserInteractionEnabled = true
        
        let pushLabel = UILabel()
        pushLabel.text = "Allow Push Notifications"
        pushLabel.textColor = .black
        pushLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        let togglePush = UISwitch()
        togglePush.preferredStyle = .sliding
        togglePush.setOn(viewModel?.allowPushNotifications ?? false, animated: false)
        togglePush.addTarget(self.viewModel, action: #selector(self.viewModel?.togglePush(send:)), for: .valueChanged)
        
        container.addSubViews(pushLabel, togglePush)
        pushLabel.applyViewConstraints(leading: container.leadingAnchor, centerY: container.centerYAnchor, value: .init(top: 0, left: 10, bottom: 0, right: 0))
        togglePush.applyViewConstraints( trailing: container.trailingAnchor, centerY: container.centerYAnchor, value: .init(top: 0, left: 0, bottom: 0, right: 10))
        
        return container
    }()
    
    lazy var containerFaceId: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.isUserInteractionEnabled = true
        
        let faceIdLabel = UILabel()
        faceIdLabel.text = "Enable Face/Touch ID"
        faceIdLabel.textColor = .black
        faceIdLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        let toggleFaceID = UISwitch()
        toggleFaceID.preferredStyle = .sliding
        toggleFaceID.setOn(viewModel?.allowFaceID ?? false, animated: false)
        toggleFaceID.addTarget(self.viewModel, action: #selector(self.viewModel?.toggleFaceID(send:)), for: .valueChanged)
        
        container.addSubViews(faceIdLabel, toggleFaceID)
        faceIdLabel.applyViewConstraints(leading: container.leadingAnchor, centerY: container.centerYAnchor, value: .init(top: 0, left: 10, bottom: 0, right: 0))
        toggleFaceID.applyViewConstraints( trailing: container.trailingAnchor, centerY: container.centerYAnchor, value: .init(top: 0, left: 0, bottom: 0, right: 10))
        
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        view.addSubview(generalProfileLabel)
        generalProfileLabel.applyViewConstraints(leading: view.leadingAnchor, top: view.safeAreaLayoutGuide.topAnchor, value: .init(top: 40, left: 10, bottom: 0, right: 0))
        
        view.addSubview(containerPushNotification)
        containerPushNotification.applyViewConstraints(leading: view.leadingAnchor, top: generalProfileLabel.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: 0, height: 40), value: .init(top: 5, left: 0, bottom: 0, right: 0))
        
        view.addSubview(containerFaceId)
        containerFaceId.applyViewConstraints(leading: view.leadingAnchor, top: containerPushNotification.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: 0, height: 40), value: .init(top: 2, left: 0, bottom: 0, right: 0))
    }
    
    fileprivate func setupView() {
        viewModel?.handleBackground(view: view)
        
        setupNavigationBar(isHidden: false, isTranslucent: false, title: "Configurações", isLargeTitle: false, titleColor: .darkGray, backButtonIsHidden: false, backButtonTitle: "", backButtonColor: AppColors.primaryColor(), backgroungColor: .white, withShadow: true, animated: true)
    }

}
