//
//  UserModel.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 27/03/21.
//

import Foundation

struct UserModel: Codable {
    var fullName: String
    var phoneNumber: String
    var email: String
    var photo: Data
}
