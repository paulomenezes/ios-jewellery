//
//  OnboardindViewController.swift
//  Jewellery
//
//  Created by Paulo Menezes on 01/10/21.
//

import UIKit

final class OnboardingViewController: UIViewController {
    private var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "The best jewellery in The Town Now!"
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.textColor = UIColor(named: "TitleColor")
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    private var subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.text = "We Use 100% pure Metals"
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = .systemFont(ofSize: 14)
        subtitleLabel.textColor = UIColor(named: "SubtitleColor")

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return subtitleLabel
    }()
    
    private var nextButtonContainer: UIView = {
        let nextButtonContainer = UIView()
        nextButtonContainer.translatesAutoresizingMaskIntoConstraints = false
        nextButtonContainer.layer.cornerRadius = 25
        nextButtonContainer.backgroundColor = UIColor(named: "OnboardingCardBackground")
        nextButtonContainer.transform = CGAffineTransform(rotationAngle: CGFloat(45.0 * .pi)/180);
        
        return nextButtonContainer
    }()
    
    private var nextButtonImageView: UIImageView = {
        let nextButtonImageView = UIImageView(image: UIImage(named: "OnboardingNextImage"))
        nextButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        nextButtonImageView.contentMode = .scaleAspectFit
        
        return nextButtonImageView
    }()
    
    private var mainImageView: UIImageView = {
        let mainImageView = UIImageView(image: UIImage(named: "JewelleryImage"))
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.contentMode = .scaleAspectFit
        
        return mainImageView
    }()
    
    private var container: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 25
        container.backgroundColor = UIColor(named: "OnboardingCardBackground")
        
        return container
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private var stackViewTopAnchorConstraint: NSLayoutConstraint?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        let isLandscape = newCollection.verticalSizeClass == .compact
        
        stackView.axis = isLandscape ? .horizontal : .vertical
        
        if isLandscape {
            stackViewTopAnchorConstraint = stackView.constraintTop(constant: 16)
        } else {
            stackViewTopAnchorConstraint?.isActive = false
        }
    }
    
    @objc
    func nextButtonTapped() {
        let viewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        
        navigationController?.pushViewController(viewController, animated: true)
    }

}

// MARK: Layout configuration extension
private extension OnboardingViewController {
    func configureLayout() {
        view.backgroundColor = UIColor(named: "OnboardingBackground")
        
        let size = nextButtonImageView.image!.size.width * 0.6
        
        stackView.addArrangedSubview(mainImageView)
        stackView.addArrangedSubview(container)
        stackView.addTo(view)
        stackView.constraintHorizontal(constant: 16)
        
        if UIDevice.isPad() {
            stackView.constraintCenterY()
            stackView.constraintWidth(multiplier: 0.6)
        } else {
            stackView.constraintBottom(constant: -size + 24)
        }
        
        let textsStackview = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        textsStackview.axis = .vertical
        textsStackview.spacing = 16
        textsStackview.addTo(container)
        textsStackview.constraintCenterX()
        textsStackview.constraintWidth(multiplier: 0.9)
        textsStackview.constraintTop(constant: 16)
        
        container.constraintSameHeight(textsStackview, multiplier: 1.8)

        nextButtonContainer.addTo(container)
        nextButtonContainer.constraintCenterX()
        nextButtonContainer.constraintSize(size)
        nextButtonContainer.constraintCenterY(to: container.bottomAnchor)
        
        nextButtonImageView.addTo(container)
        nextButtonImageView.constraintCenterX()
        nextButtonImageView.constraintCenterY(to: container.bottomAnchor)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(nextButtonTapped))
        gesture.numberOfTapsRequired = 1

        nextButtonImageView.addGestureRecognizer(gesture)
        nextButtonImageView.isUserInteractionEnabled = true
    }
}
