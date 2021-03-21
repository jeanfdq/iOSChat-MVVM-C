//
//  Data.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 21/03/21.
//

import UIKit

extension Data {
    
    var toImage: UIImage? { UIImage(data: self) }

     func toModel<T:Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
    
    func toJSON() -> NSDictionary? {
        return try? JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? NSDictionary
    }
}
