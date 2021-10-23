//
//  UIDevice+Extension.swift
//  Jewellery
//
//  Created by Paulo Menezes on 02/10/21.
//

import UIKit

extension UIDevice {
    static func isPad() -> Bool {
        return current.userInterfaceIdiom == .pad
    }
}
