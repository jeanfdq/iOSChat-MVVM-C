//
//  UserModel.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 27/03/21.
//

import Foundation

struct UserModel: Codable {
    let fullName: String
    let phoneNumber: String
    let email: String
    let photo: Data
}
