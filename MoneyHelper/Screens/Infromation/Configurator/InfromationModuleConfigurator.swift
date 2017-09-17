//
//  InfromationModuleConfigurator.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit

final class InfromationModuleConfigurator {

    // MARK: Internal methods

    func configure() -> InfromationViewController {
        let view = InfromationViewController()
        let presenter = InfromationPresenter()
        let router = InfromationRouter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }

}
