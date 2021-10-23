//
//  CardCollectionViewCell.swift
//  Jewellery
//
//  Created by Paulo Menezes on 02/10/21.
//

import UIKit

struct CardCollectionViewCellModel {
    let imageName: String
    let title: String
    let subtitle: String
    let price: String
}

final class CardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    @IBOutlet weak var viewPrice: UIView!
    @IBOutlet weak var labelPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(model: CardCollectionViewCellModel) {
        imageView.image = UIImage(named: model.imageName)
        labelTitle.text = model.title
        labelSubtitle.text = model.subtitle
        labelPrice.text = "$ \(model.price)"
        
        viewBackground.layer.cornerRadius = 32
        
        let gradient = CAGradientLayer()
        
        gradient.frame = viewPrice.bounds
        gradient.colors = [UIColor(named: "ColorButtonGradientTo")!.cgColor, UIColor(named: "ColorButtonGradientFrom")!.cgColor]
        gradient.startPoint = CGPoint.zero;
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        gradient.cornerRadius = 9
        
        viewPrice.layer.insertSublayer(gradient, at: 0)
        

    }

}
