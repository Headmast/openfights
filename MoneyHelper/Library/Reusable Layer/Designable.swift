//
//  Preloadable.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 17/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import Foundation
import UIKit

/// Inherit custom subview from this class instead of UIView,
///     mark it as @IBDesignable,
///     set the file's owner and do not set the View's class,
///     =>
///     It renders in the IB!
class DesignableView: UIView {

    var view: UIView! {
        return subviews.first
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // TODO: check it
        _ = setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        _ = setup()
    }

    func setup() -> UIView? {
        let view = Bundle(for: type(of: self)).loadNibNamed(self.nameOfClass, owner: self, options: nil)?.first as? UIView
        if let v = view {
            addSubview(v)
            v.frame = self.bounds
        }

        return view
    }

}
