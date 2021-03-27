//
//  NSPredicate.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 26/03/21.
//

import Foundation

extension NSPredicate {
    
    static func buildPredicateWithUserEmail(_ email: String ) -> NSPredicate {
        return NSPredicate(format: "userEmail == %@", email)
    }
    
}
