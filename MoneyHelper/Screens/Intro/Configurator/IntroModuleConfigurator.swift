//
//  IntroModuleConfigurator.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit

final class IntroModuleConfigurator {

    // MARK: Internal methods

    func configure() -> IntroViewController {
        let view = IntroViewController()
        let presenter = IntroPresenter()
        let router = IntroRouter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }

}
