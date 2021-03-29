//
//  OnBoardingViewController.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 22/03/21.
//

import UIKit

protocol OnBoardingCoordinatorDelagate: class {
    func goToLogin()
    func goToSignUp()
}

class OnBoardingViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    weak var delegate: OnBoardingCoordinatorDelagate?
    
    private let reuseIdentifier = "Cell"
    private var indexOfCellBeforeDragging = 0
    private let imagesOnBoarding = [UIImage(systemName: "message"), UIImage(systemName: "person.fill.viewfinder"), UIImage(systemName: "bell.badge"), UIImage()]
    
    private lazy var pageControl:UIPageControl = {
        let pg = UIPageControl()
        pg.currentPage = 0
        pg.currentPageIndicatorTintColor =  .white
        pg.pageIndicatorTintColor = .init(white: 0.5, alpha: 0.7)
        pg.numberOfPages = imagesOnBoarding.count
        return pg
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        setupCollectionView()
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.showsHorizontalScrollIndicator = false
        // Register cell classes
        self.collectionView.register(OnboardingViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    fileprivate func setupUI() {
        
        setupNavigationBar(isHidden: true)
    }
    
    fileprivate func setupView() {
        
        view.addSubview(pageControl)
        pageControl.applyViewConstraints( bottom: view.bottomAnchor, centerX: view.centerXAnchor, value: .init(top: 0, left: 0, bottom: 40, right: 0))
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        if pageControl.currentPage == 0 {
            collectionView.contentOffset = .zero
        }else {
            let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }


        collectionView.invalidateIntrinsicContentSize()
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        indexOfCellBeforeDragging = indexOfCell()
    }

    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        // Stop scrollView sliding:
        targetContentOffset.pointee = scrollView.contentOffset

        // calculate where scrollView should snap to:
        let indexOfMajorCell = self.indexOfCell()

        // calculate conditions:
        let dataSourceCount = collectionView(collectionView!, numberOfItemsInSection: 0)
        let swipeVelocityThreshold: CGFloat = 0.5 // after some trail and error
        let hasEnoughVelocityToSlideToTheNextCell = indexOfCellBeforeDragging + 1 < dataSourceCount && velocity.x > swipeVelocityThreshold
        let hasEnoughVelocityToSlideToThePreviousCell = indexOfCellBeforeDragging - 1 >= 0 && velocity.x < -swipeVelocityThreshold
        let majorCellIsTheCellBeforeDragging = indexOfMajorCell == indexOfCellBeforeDragging
        let didUseSwipeToSkipCell = majorCellIsTheCellBeforeDragging && (hasEnoughVelocityToSlideToTheNextCell || hasEnoughVelocityToSlideToThePreviousCell)

        if didUseSwipeToSkipCell {

            let snapToIndex = indexOfCellBeforeDragging + (hasEnoughVelocityToSlideToTheNextCell ? 1 : -1)
            let toValue = view.frame.width * CGFloat(snapToIndex)

            // Damping equal 1 => no oscillations => decay animation:
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: velocity.x, options: .allowUserInteraction, animations: {
                scrollView.contentOffset = CGPoint(x: toValue, y: 0)
                scrollView.layoutIfNeeded()
            }, completion: nil)

        } else {
            pageControl.currentPage = indexOfMajorCell

            // This is a much better way to scroll to a cell:
            let indexPathPage = IndexPath(row: indexOfMajorCell, section: 0)
            collectionViewLayout.collectionView!.scrollToItem(at: indexPathPage, at: .centeredHorizontally, animated: true)

        }

    }

    fileprivate func indexOfCell() -> Int {
        let itemWidth = view.frame.size.width
        let proportionalOffset = collectionViewLayout.collectionView!.contentOffset.x / itemWidth
        let index = Int(round(proportionalOffset))
        let numberOfItems = collectionView.numberOfItems(inSection: 0)
        let safeIndex = max(0, min(numberOfItems - 1, index))
        return safeIndex
    }
    
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imagesOnBoarding.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! OnboardingViewCell
        cell.imageOnBoarding.image = imagesOnBoarding[indexPath.item]
        cell.containerPerfilChoose.isHidden = (indexPath.item + 1) < imagesOnBoarding.count
        
        cell.goToLogin  = delegate?.goToLogin
        cell.goToSignUp = delegate?.goToSignUp
        
        return cell
    }
    
    // MARK: UICollectionViewFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { return .init(width: Constants.screenWidth, height: Constants.screenHeight) }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
