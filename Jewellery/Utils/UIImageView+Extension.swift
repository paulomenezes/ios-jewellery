//
//  UIImageView+Extension.swift
//  Jewellery
//
//  Created by Paulo Menezes on 02/10/21.
//

import UIKit

extension UIImageView {
    func addTap(action: Selector) {
        let gesture = UITapGestureRecognizer(target: self, action: action)
        gesture.numberOfTapsRequired = 1
        
        addGestureRecognizer(gesture)
        isUserInteractionEnabled = true
    }
}
