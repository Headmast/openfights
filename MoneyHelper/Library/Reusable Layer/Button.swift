//
//  Button.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 17/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit

@IBDesignable
class Button: UIButton {

    // MARK: Properties

    /// This property is used to set the font button
    var buttonFont: UIFont {
        return UIFont.systemFont(ofSize: 16, weight: UIFontWeightBold)
    }

    /// This property is used to set the title color for default button state
    @IBInspectable var normalTitleColor: UIColor? {
        get {
            return titleColor(for: UIControlState())
        }
        set {
            setTitleColor(newValue, for: UIControlState())
        }
    }

    /// This property is used to set the title color for highlighted button state
    @IBInspectable var highlightedTitleColor: UIColor? {
        get {
            return titleColor(for: .highlighted)
        }
        set {
            setTitleColor(newValue, for: .highlighted)
        }
    }

    /// This property is used to set the background color for default button state
    @IBInspectable var normalBackgroundColor: UIColor? {
        didSet {
            backgroundColor = normalBackgroundColor
        }
    }

    /// This property is used to set the background color for highlighted button state
    @IBInspectable var highlightedBackgroundColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = highlightedBackgroundColor.cgColor
        }
    }

    /// This property is used to set the background color for disable button state
    @IBInspectable var disableBackgroundColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = disableBackgroundColor.cgColor
        }

    }

    /// This property is used to set the corner radius of button
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var normalBorderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = normalBorderColor.cgColor
        }
    }

    @IBInspectable var highlightedBorderColor: UIColor = UIColor.white {
        didSet {
            if isHighlighted {
                layer.borderColor = highlightedBorderColor.cgColor
            } else {
                layer.borderColor = normalBorderColor.cgColor
            }
        }
    }

    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    // MARK: Initialization and deinitialization

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyStyle()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyStyle()
    }

    // MARK: NSObject UIKit Additions

    override func awakeFromNib() {
        applyStyle()
    }

    override func prepareForInterfaceBuilder() {
        applyStyle()
    }

    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                backgroundColor = highlightedBackgroundColor
                layer.borderColor = highlightedBorderColor.cgColor
            } else {
                backgroundColor = normalBackgroundColor
                layer.borderColor = normalBorderColor.cgColor
            }
        }
    }

    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                backgroundColor = normalBackgroundColor
            } else {
                backgroundColor = disableBackgroundColor
            }
        }
    }

    //resize by title
    override var intrinsicContentSize: CGSize {
        let labelSize = titleLabel?.sizeThatFits(CGSize(width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude)) ?? CGSize(width: 0.0, height: 0.0)
        let desiredButtonSize = CGSize(width: labelSize.width + titleEdgeInsets.left + titleEdgeInsets.right, height: labelSize.height + titleEdgeInsets.top + titleEdgeInsets.bottom)
        return desiredButtonSize
    }

    public func applyDefaultColorState() {
    }

    // MARK: Private Helpers

    private func applyStyle() {
        titleLabel?.font = buttonFont
        applyDefaultColorState()
    }

}
