//
//  OnboardingViewCell.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 22/03/21.
//

import UIKit

class OnboardingViewCell: UICollectionViewCell {
    
    let imageOnBoarding: UIImageView = {
        let imageOnBoarding = UIImageView()
        imageOnBoarding.image = UIImage(systemName: "message")?.withTintColor(.white)
        imageOnBoarding.tintColor = .white
        return imageOnBoarding
    }()
    
    
    lazy var containerPerfilChoose: UIView = {
       
        let container = UIView()
        container.backgroundColor = AppColors.backgroudSecundary()
        
        let logo = UIImageView(image: Constants.logoTipo)
    
        let screenLabel = UILabel()
        screenLabel.text      = "Bem-vindo ao iOSChat"
        screenLabel.textColor = AppColors.primaryColor()
        screenLabel.font      = .systemFont(ofSize: 24, weight: .semibold)
    
        let loginButton = UIButton(type: .system)
        loginButton.buildPrimaryButtonWithCorner("Log In")
        loginButton.addTapGesture { [unowned self] in
            self.goToLogin?()
        }
    

        let signUpButton = UIButton(type: .system)
        signUpButton.buildWhiteButtonWithCorner("Sign Up")
        signUpButton.addTapGesture { [unowned self] in
            self.goToSignUp?()
        }
        
        container.addSubViews(logo, screenLabel, loginButton, signUpButton)
        
        let logoSize: CGFloat = Constants.screenWidth * 0.4
        logo.applyViewConstraints(top: container.topAnchor,  centerX: container.centerXAnchor, size: .init(width: logoSize, height: logoSize), value: .init(top: 100, left: 0, bottom: 0, right: 0))
        
        screenLabel.applyViewConstraints(top: logo.bottomAnchor, centerX: container.centerXAnchor, size: .zero, value: .init(top: 30, left: 0, bottom: 0, right: 0))
        
        let widthButton: CGFloat = Constants.screenWidth * 0.7
        loginButton.applyViewConstraints(top: screenLabel.bottomAnchor, centerX: container.centerXAnchor, size: .init(width: widthButton, height: 45), value: .init(top: 40, left: 0, bottom: 0, right: 0))
        signUpButton.applyViewConstraints(top: loginButton.bottomAnchor, centerX: container.centerXAnchor, size: .init(width: widthButton, height: 45), value: .init(top: 15, left: 0, bottom: 0, right: 0))
        
        return container
        
    }()
    
    var goToLogin: (()->Void)?
    var goToSignUp: (()->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = AppColors.primaryColor()
        addSubview(imageOnBoarding)
        let sizeImage: CGFloat = frame.width * 0.5
        imageOnBoarding.applyCenterIntoSuperView(size: .init(width: sizeImage, height: sizeImage))
        
        addSubview(containerPerfilChoose)
        containerPerfilChoose.applyViewIntoSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
