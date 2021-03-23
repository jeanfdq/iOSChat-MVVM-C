//
//  UIButton.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

extension UIButton {
    
    func setShakeAnime() {
            
            let animation = CABasicAnimation(keyPath: "position")
            animation.fillMode = .forwards
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            animation.repeatCount = 2
            animation.autoreverses = true
            animation.duration = 0.1
            animation.fromValue = CGPoint(x: self.center.x - 5, y: self.center.y)
            animation.toValue = CGPoint(x: self.center.x + 5, y: self.center.y)
            layer.add(animation, forKey: nil)
            
    }

    func setShakePulse(){
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.9
        pulse.toValue = 1
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1
        
        layer.add(pulse, forKey: nil)
        
    }

    func setShakeFlash(){
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.autoreverses = true
        flash.repeatCount = 3
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        layer.add(flash, forKey: nil)
        
    }

    func loading(_ show: Bool, activityIndicatorViewStyle: UIActivityIndicatorView.Style = .medium) {
        let tag = 808404
        isEnabled = !show
        if show {
            self.alpha = 0.5
            let indicator = UIActivityIndicatorView(style: activityIndicatorViewStyle)
            let buttonHeight = self.bounds.size.height
            let buttonWidth = self.bounds.size.width
            indicator.center = CGPoint(x: buttonWidth - 30, y: buttonHeight/2)
            indicator.tag = tag
            self.addSubview(indicator)
            indicator.startAnimating()
        } else {
            self.alpha = 1.0
            if let indicator = self.viewWithTag(tag) as? UIActivityIndicatorView {
                indicator.stopAnimating()
                indicator.removeFromSuperview()
            }
        }
    }

    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi)
        rotation.duration = 0.5
        rotation.isCumulative = true
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    func buildPrimaryButtonWithCorner(_ title: String) {
        
        setAttributedTitle(NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .semibold)]), for: .normal)
        backgroundColor = AppColors.primaryColor()
        setCorner(radius: 20)
        
    }
    
    func buildWhiteButtonWithCorner(_ title: String) {
        
        setAttributedTitle(NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor : AppColors.primaryColor(), NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .semibold)]), for: .normal)
        backgroundColor = .clear
        setCorner(radius: 20)
        setBorder(AppColors.primaryColor(), 0.5)
    }
    
}
