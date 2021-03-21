//
//  Encodable.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import Foundation

extension Encodable {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
