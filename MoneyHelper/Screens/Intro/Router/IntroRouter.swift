//
//  IntroRouter.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit

final class IntroRouter: IntroRouterInput {

	// MARK: Properties

    weak var view: ModuleTransitionable?

	// MARK: IntroRouterInput

    // Show main screen
    func showMainScreen() {
        if let window = UIApplication.shared.delegate?.window {
            window?.rootViewController = TabbarModuleConfigurator().configure()
        }
    }
}
