//
//  UIViewController.swift
//  GoLamaGo
//
//  Created by Ivan Smetanin on 07/07/2017.
//  Copyright © 2017 Ivan Smetanin. All rights reserved.
//

import UIKit

extension UIViewController {
    @objc
    class func controller() -> Self {
        let classReference = self.self
        return classReference.init(nibName: self.nameOfClass, bundle: nil)
    }
}
