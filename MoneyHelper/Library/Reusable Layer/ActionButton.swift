//
//  ActionButton.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 17/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit
@IBDesignable
class ActionButton: Button {

    fileprivate let radius: CGFloat = 24.0

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyCorners(cornerRadius: radius, corners: [.bottomRight, .topLeft])
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyCorners(cornerRadius: radius, corners: [.bottomRight, .topLeft])
    }

}
