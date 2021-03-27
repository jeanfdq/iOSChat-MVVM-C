//
//  PerfilSettingViewController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 27/03/21.
//

import UIKit

class PerfilSettingsViewController: UIViewController {

    var viewModel: PerfilSettingsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    fileprivate func setupView() {
        view.backgroundColor = .init(white: 0.5, alpha: 1)
        
        setupNavigationBar(isHidden: false, isTranslucent: false, title: "Configurações", isLargeTitle: false, titleColor: .darkGray, backButtonIsHidden: false, backButtonTitle: "", backButtonColor: AppColors.primaryColor(), backgroungColor: .white, withShadow: true, animated: true)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self.viewModel, action: #selector(self.viewModel?.tappedDone))
    }

}
