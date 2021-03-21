//
//  LauchScreenViewController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 20/03/21.
//

import UIKit

class LauchScreenViewController: UIViewController {

    var viewModel: LaunchScreenViewModel
    
    let logo:UIImageView = {
        let logo = UIImageView(image: #imageLiteral(resourceName: "chatIcon"))
        return logo
    }()
    
    init(_ viewModel: LaunchScreenViewModel) {
    
        self.viewModel  = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar(isHidden: true)
        
        addViewCenterInto(logo, size: .init(width: view.frame.width * 0.6, height: view.frame.width * 0.6))
        
        viewModel.handleBackground(view)
        viewModel.inicializeSplash()
    }
}
