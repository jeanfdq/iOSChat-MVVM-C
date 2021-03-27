//
//  CoordinatorStack.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 20/03/21.
//

import Foundation

struct CoordinatorStack<Element> {
    
    var items = [Element]() {
        didSet {
            #if !PROD
            print("items: \(items)")
            #endif
        }
    }
    
    mutating func push(_ item: Element){
        items.append(item)
    }
    
    mutating func pop() {
        if items.count > 0 {
            items.removeLast()
        }
    }
    
    mutating func clear() {
        items.removeAll()
    }
    
}
