//
//  MainTabBarViewController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 20/03/21.
//

import UIKit


private enum MainTabControllers {
    case home
    case contacts
    case perfil
    
    var controllers: AnyClass {
        switch self {
        case .home: return HomeViewController.self
        case .contacts: return ContactsViewController.self
        case .perfil: return PerfilViewController.self
        }
    }
}

protocol MainTabBarViewControllerDelegate: class {
    func registrateViewControllers(viewController: UIViewController)
}

class MainTabBarViewController: UITabBarController {

    weak var mainTabDelegate: MainTabBarViewControllerDelegate?
    
    let home        = HomeCoordinator(UINavigationController())
    let constacts   = ConstactsCoordinator(UINavigationController())
    let perfil      = PerfilCoordinator(UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupTabs()
        //registrateViewControllers()
    }
    
    fileprivate func setupTabBar() {
        tabBar.barTintColor = .white
        tabBar.tintColor = AppColors.primaryColor()
        tabBar.unselectedItemTintColor = AppColors.tabBarUnselected()
        
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
    }
    
    fileprivate func setupTabs() {
        
        home.start()
        constacts.start()
        perfil.start()
        
        setViewControllers([home.navigationController, constacts.navigationController, perfil.navigationController], animated: true)
        
    }
//
//    fileprivate func registrateViewControllers() {
//        guard let viewControllers = viewControllers else {return}
//        for viewController in viewControllers {
//            self.mainTabDelegate?.registrateViewControllers(viewController: viewController.)
//        }
//    }

}
