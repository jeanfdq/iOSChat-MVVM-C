//
//  GetSafeAreaSize.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 30/03/21.
//

import UIKit

struct GetSafeAreaSize {
    
    static func getSize() -> UIEdgeInsets {
        
        let mySceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        
        if let sceneDelegate = mySceneDelegate {
            
            guard let window = sceneDelegate.window else {return UIEdgeInsets.zero}
            
            return window.safeAreaInsets
            
            
        }else{
            return UIEdgeInsets.zero
        }
        
    }
    
}
