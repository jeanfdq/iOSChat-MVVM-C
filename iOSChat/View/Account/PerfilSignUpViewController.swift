//
//  PerfilSignUpViewController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

class PerfilSignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.navigationController?.popViewController(animated: false)
        }
    }

}
