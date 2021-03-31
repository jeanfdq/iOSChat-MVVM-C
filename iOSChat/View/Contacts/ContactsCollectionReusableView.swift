//
//  ContactsCollectionReusableView.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 29/03/21.
//

import UIKit

class ContactsCollectionReusableView: UICollectionReusableView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
