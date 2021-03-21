//
//  AppColors.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 20/03/21.
//

import UIKit

class AppColors {
    
    static func initColor(named: String) -> UIColor {
        return UIColor(named: named) ?? UIColor.clear
    }
    
    static func primaryColor() -> UIColor {
        return .systemBlue
    }
    
    static func backgroudSecundary() -> UIColor {
        return AppColors.initColor(named: "backgroundSecundary")
    }
    
    static func tabBarUnselected() -> UIColor {
        return AppColors.initColor(named: "tabBarUnselected")
    }
}
