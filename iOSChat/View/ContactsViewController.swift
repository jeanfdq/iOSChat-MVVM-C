//
//  ContactsViewController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 20/03/21.
//

import UIKit

class ContactsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var viewModel: ContactsViewModel? {
        didSet {
            guard let viewModel = viewModel else {return}
            listUser = viewModel.getListOfUsers()
        }
    }
    
    let cellReuseIdentifier = "ContactsCell"
    
    var listUser = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar(isHidden: false, isTranslucent: false, title: Constants.TabBar.TabBarTitle.contacts.rawValue, titleColor: .black, backgroungColor: .white, withShadow: true)
        
        collectionView.backgroundColor = AppColors.customGrayBrackground()
        collectionView.register(ContactsViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listUser.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! ContactsViewCell
        cell.userPhoto.image    = listUser[indexPath.item].photo.toImage
        cell.userName.text      = listUser[indexPath.item].fullName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.5
    }
    
}
