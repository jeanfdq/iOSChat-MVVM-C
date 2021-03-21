//
//  CoordinatorStack.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 20/03/21.
//

import Foundation

struct CoordinatorStack<Element> {
    
    var items = [Element]()
    
    mutating func push(_ item: Element){
        items.append(item)
    }
    
    mutating func pop() {
        items.removeLast()
    }
    
    mutating func clear() {
        items.removeAll()
    }
    
}
