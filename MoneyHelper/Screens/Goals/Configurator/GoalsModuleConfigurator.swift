//
//  GoalsModuleConfigurator.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit

final class GoalsModuleConfigurator {

    // MARK: Internal methods

    func configure() -> GoalsViewController {
        let view = GoalsViewController()
        let presenter = GoalsPresenter()
        let router = GoalsRouter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }

}
