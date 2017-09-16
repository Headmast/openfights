//
//  UIView.swift
//  GoLamaGo
//
//  Created by Andrey Anisimov on 13.03.17.
//  Copyright © 2017 Surf. All rights reserved.
//

import Foundation
import UIKit
public extension UIView {

    func applyCorners(cornerRadius: CGFloat? = nil, corners: UIRectCorner) { //[.bottomRight, .topLeft]
        if let radius = cornerRadius {
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center

            rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
            self.layer.backgroundColor = self.backgroundColor?.cgColor
            self.layer.mask = rectShape
        }
    }

}
