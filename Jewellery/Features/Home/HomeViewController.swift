//
//  HomeViewController.swift
//  Jewellery
//
//  Created by Paulo Menezes on 02/10/21.
//

import UIKit

final class HomeViewController: UIViewController {
    @IBOutlet weak var textFieldSearch: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var stackViewHeader: UIStackView!
    
    private let gradient = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureBackground()
        configureNavigationBar()
        configureTextFieldSearch()
        configureCollectionView()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        let isLandscape = newCollection.verticalSizeClass == .compact
        
        stackViewHeader.isHidden = isLandscape
        configureBackground(isLandscape: isLandscape)
        configureRightBarButton(isLandscape: isLandscape)
        
        navigationItem.title = isLandscape ? "Best jewellery for you" : nil
    }
    
    @objc
    func shoppingCartTapped() {
        
    }
}

// MARK: Navigation bar configuration extension
extension HomeViewController {
    func configureNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "MenuIcon"),
            style: .plain,
            target: self,
            action: nil
        )
        
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        configureRightBarButton(isLandscape: false)
        
    }
    
    func configureRightBarButton(isLandscape: Bool) {
        if isLandscape {
            navigationItem.rightBarButtonItems = [
                UIBarButtonItem(
                    image: UIImage(named: "IconSearch"),
                    style: .plain,
                    target: self,
                    action: #selector(shoppingCartTapped)
                ),
                UIBarButtonItem(
                    image: UIImage(named: "ShoppingCartIcon"),
                    style: .plain,
                    target: self,
                    action: #selector(shoppingCartTapped)
                )

            ]
            navigationItem.rightBarButtonItems?[0].tintColor = .black
            navigationItem.rightBarButtonItems?[1].tintColor = .black

        } else {
            navigationItem.rightBarButtonItems = [
                UIBarButtonItem(
                    image: UIImage(named: "ShoppingCartIcon"),
                    style: .plain,
                    target: self,
                    action: #selector(shoppingCartTapped)
                )
            ]
            
            navigationItem.rightBarButtonItems?[0].tintColor = .black

        }
    }
    
    func configureTextFieldSearch() {
        let searchIconContainer = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 32))
        let searchIcon = UIImageView(image: UIImage(named: "IconSearch"))
        
        searchIconContainer.addSubview(searchIcon)
        
        searchIcon.centerXAnchor.constraint(equalTo: searchIconContainer.centerXAnchor).isActive = true
        searchIcon.centerYAnchor.constraint(equalTo: searchIconContainer.centerYAnchor).isActive = true
        
        textFieldSearch.layer.cornerRadius = 18
        textFieldSearch.leftView = searchIconContainer
        textFieldSearch.leftViewMode = .always
    }
    
    func configureBackground(isLandscape: Bool = false) {
        if isLandscape {
            gradient.frame = CGRect(origin: UIScreen.main.bounds.origin, size: CGSize(width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.width))
        } else {
            gradient.frame = UIScreen.main.bounds
        }
        
        gradient.colors = [UIColor.white.cgColor, UIColor(named: "AppBackground")!.cgColor]
        
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cardCollectionViewCellID")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 240, height: 320)
        layout.scrollDirection = .horizontal
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = layout
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCollectionViewCellID", for: indexPath) as? CardCollectionViewCell else {
            fatalError()
        }
        
        cell.configure(
            model: CardCollectionViewCellModel(
                        imageName: "CardImageView1",
                        title: "Diamond Ring",
                        subtitle: "Pure ring with Diamonds (0.1400 Ct)",
                        price: "600"
            )
        )
        
        return cell
    }
    
    
}
