//
//  ChatViewController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 30/03/21.
//

import UIKit

class ChatViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let cellReuseIdentifier = "ChatViewController"
    
    
    var userDestination: UserModel
    
    lazy var fieldMsg:UITextField = {
       let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Start typing...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(white: 0.65, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .semibold)])
        tf.backgroundColor = AppColors.customGrayBrackground()
        tf.textColor = .black
        tf.setCorner(radius: 12)
        tf.paddingLeft(value: 10)
        tf.delegate = self
       return tf
    }()
    
    lazy var btnSendMsg:UIButton = {
        
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "paperplane.fill")?.withTintColor(AppColors.primaryColor(), renderingMode: .alwaysOriginal), for: .normal)
        btn.contentVerticalAlignment = .fill
        btn.contentHorizontalAlignment = .fill
        btn.addTarget(self, action: #selector(self.sendMsg), for: .touchUpInside)
        return btn
        
    }()
    
    lazy var btnSendImgMsg:UIButton = {
        
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "camera.fill")?.withTintColor(AppColors.primaryColor(), renderingMode: .alwaysOriginal), for: .normal)
        btn.contentVerticalAlignment = .fill
        btn.contentHorizontalAlignment = .fill
        btn.addTarget(self, action: #selector(self.optionGetPhoto), for: .touchUpInside)
        return btn
        
    }()
    
    lazy var inputContainer:UIView = {
        
        let safeAreaSize = GetSafeAreaSize.getSize()
        
        let containerView = UIView()
        containerView.backgroundColor = UIColor.white
        containerView.layer.borderWidth = 0
        containerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: safeAreaSize.bottom + 55)
        
        containerView.addSubview(btnSendImgMsg)
        containerView.addSubview(fieldMsg)
        containerView.addSubview(btnSendMsg)
        
        btnSendImgMsg.applyViewConstraints(trailing: fieldMsg.leadingAnchor, centerY: fieldMsg.centerYAnchor, size: .init(width: 35, height: 25), value: .init(top: 0, left: 10, bottom: 0, right: 5))

        fieldMsg.applyViewConstraints(centerX: containerView.centerXAnchor, centerY: containerView.centerYAnchor , size: .init(width: view.frame.width * 0.75, height: 30), value: .init(top: 0, left: 10, bottom: 0 , right: 10))

        btnSendMsg.applyViewConstraints( trailing: containerView.trailingAnchor, centerY: fieldMsg.centerYAnchor, size: .init(width: 25, height: 25), value: .init(top: 0, left: 0, bottom: 0, right: 10))

        return containerView
    }()
    
    init(userDestination: UserModel) {
        self.userDestination = userDestination
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var inputAccessoryView: UIView? {
        get{
            return inputContainer
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar(isHidden: false, isTranslucent: false, title: userDestination.fullName, isLargeTitle: false, titleColor: .darkGray, backButtonIsHidden: false, backButtonTitle: "Chats", backButtonColor: AppColors.primaryColor(), backgroungColor: .white, withShadow: true, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape")?.withTintColor(AppColors.primaryColor(), renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(self.settingsChat))
        
        
        collectionView.backgroundColor = .white
        collectionView.keyboardDismissMode = .interactive
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView.collectionViewLayout = {
           let layout = UICollectionViewFlowLayout()
            layout.itemSize = .init(width: view.frame.width, height: 60)
            layout.minimumLineSpacing = 0
            layout.scrollDirection = .vertical
            return layout
        }()
    }
    
    @objc
    fileprivate func settingsChat(){
        
    }
    
    @objc
    fileprivate func sendMsg(){
        
    }
    
    @objc
    fileprivate func optionGetPhoto(){
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath)
        
        return cell
    }

}

extension ChatViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        textField.resignFirstResponder()
        return true
    }
}
