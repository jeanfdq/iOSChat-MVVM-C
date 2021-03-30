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
    
    let reuseIdentifierCell = "ContactsCell"
    let reuseIdentifierHeader = "ContactsHeader"
    
    var listUser = [UserModel]()
    var listUserSearched = [UserModel]()
    var searching: Bool  = false
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNaviBar()
        setupCollectionView()
        setupSearchController()
        
    }
    
    fileprivate func setupNaviBar() {
        setupNavigationBar(isHidden: false, isTranslucent: false, title: Constants.TabBar.TabBarTitle.contacts.rawValue, titleColor: .black, backgroungColor: .white, withShadow: true)
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = AppColors.customGrayBrackground()
        collectionView.register(ContactsCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifierHeader)
        collectionView.register(ContactsViewCell.self, forCellWithReuseIdentifier: reuseIdentifierCell)
    }
    
    fileprivate func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.delegate = self
        
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.sizeToFit()
        searchController.searchBar.becomeFirstResponder()

        searchController.searchBar.setImage(UIImage(systemName: "text.magnifyingglass")?.withTintColor(.darkGray, renderingMode: .alwaysOriginal), for: .search, state: .normal)
        searchController.searchBar.barStyle = .default
        searchController.searchBar.backgroundImage = UIImage()
        searchController.searchBar.barTintColor = .white

        if #available(iOS 11.0, *) {

            if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {

                textfield.backgroundColor = AppColors.customGrayBrackground()
                textfield.textColor = .darkGray
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listUser.count //searching ? listUserSearched.count : listUser.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifierHeader, for: indexPath) as! ContactsCollectionReusableView
            header.addSubview(searchController.searchBar)
            return header
        }
        return UICollectionReusableView()

    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierCell, for: indexPath) as! ContactsViewCell
        cell.userPhoto.image    = listUser[indexPath.item].photo.toImage
        cell.userName.text      = listUser[indexPath.item].fullName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.5
    }
    
}

extension ContactsViewController: UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text
        searching = searchString?.count ?? 0 >= 2 ? true : false
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {

            if searchText.count > 2 {

                listUserSearched = listUser.filter({ (item ) -> Bool in
                    let countryText: NSString = item.fullName as NSString

                            return (countryText.range(of: searchText, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
                        })

                        collectionView.reloadData()
            }

        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        listUser = viewModel!.getListOfUsers()
        //searchController.searchBar.resignFirstResponder()
        collectionView.reloadData()
    }
    
    
}
