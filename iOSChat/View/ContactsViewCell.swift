//
//  ContactsViewCell.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 29/03/21.
//

import UIKit

class ContactsViewCell: UICollectionViewCell {
    
    let userPhoto: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(systemName: "person.circle")?.withTintColor(AppColors.customGrayBrackground(), renderingMode: .alwaysOriginal)
        photo.contentMode = .scaleAspectFill
        photo.setCorner(radius: 25)
        return photo
    }()
    
    let userName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font      = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(userPhoto)
        userPhoto.applyViewConstraints(leading: leadingAnchor, centerY: centerYAnchor, size: .init(width: 50, height: 50), value: .init(top: 0, left: 10, bottom: 0, right: 0))
        
        addSubview(userName)
        userName.applyViewConstraints(leading: userPhoto.trailingAnchor, centerY: centerYAnchor, value: .init(top: 0, left: 10, bottom: 0, right: 0))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
