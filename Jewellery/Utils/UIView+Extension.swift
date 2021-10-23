//
//  UIView+Extension.swift
//  Jewellery
//
//  Created by Paulo Menezes on 02/10/21.
//

import UIKit

extension UIView {
    func getSuperview() -> UIView {
        guard let superview = superview else {
            fatalError("Superview is not here")
        }
        
        return superview
    }
    
    func constrainToSuperviewEdges(_ edges: UIEdgeInsets) {
        let superview = getSuperview()
        
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: edges.left).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -edges.right).isActive = true
        topAnchor.constraint(equalTo: superview.topAnchor, constant: edges.top).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -edges.bottom).isActive = true
    }
    
    func constrainToSuperviewSafeAreaEdges(_ edges: UIEdgeInsets) {
        let superview = getSuperview()
        
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: edges.left).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -edges.right).isActive = true
        topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: edges.top).isActive = true
        bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -edges.bottom).isActive = true
    }
    
    func constraintCenterX() {
        centerXAnchor.constraint(equalTo: getSuperview().centerXAnchor).isActive = true
    }

    func constraintCenterY() {
        centerYAnchor.constraint(equalTo: getSuperview().centerYAnchor).isActive = true
    }

    func constraintCenter() {
        constraintCenterX()
        constraintCenterY()
    }
    
    func constraintSize(_ size: CGFloat) {
        widthAnchor.constraint(equalToConstant: size).isActive = true
        heightAnchor.constraint(equalToConstant: size).isActive = true
    }

    func constraintWidth() {
        widthAnchor.constraint(equalTo: getSuperview().widthAnchor).isActive = true
    }

    func constraintWidth(multiplier: CGFloat) {
        widthAnchor.constraint(equalTo: getSuperview().widthAnchor, multiplier: multiplier).isActive = true
    }
    
    func constraintSameHeight(_ view: UIView, multiplier: CGFloat) {
        heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier).isActive = true
    }
    
    @discardableResult
    func constraintTop(constant: CGFloat) -> NSLayoutConstraint {
        let constraint = topAnchor.constraint(equalTo: getSuperview().safeAreaLayoutGuide.topAnchor, constant: constant)
        
        constraint.isActive = true
        
        return constraint
    }
    
    func constraintBottom(constant: CGFloat) {
        bottomAnchor.constraint(equalTo: getSuperview().safeAreaLayoutGuide.bottomAnchor, constant: constant).isActive = true
    }
    
    func constraintCenterY(to: NSLayoutYAxisAnchor) {
        centerYAnchor.constraint(equalTo: to).isActive = true
    }
    
    func constraintLeft(constant: CGFloat) {
        leadingAnchor.constraint(equalTo: getSuperview().safeAreaLayoutGuide.leadingAnchor, constant: constant).isActive = true
    }
    
    func constraintRight(constant: CGFloat) {
        trailingAnchor.constraint(equalTo: getSuperview().safeAreaLayoutGuide.trailingAnchor, constant: -constant).isActive = true
    }
    
    func constraintHorizontal(constant: CGFloat) {
        constraintLeft(constant: constant)
        constraintRight(constant: constant)
    }

    func addTo(_ container: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(self)
    }
}

extension UIEdgeInsets {
    static func initialize(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> UIEdgeInsets {
        UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    static func initialize(all: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: all, left: all, bottom: all, right: all)
    }
}
