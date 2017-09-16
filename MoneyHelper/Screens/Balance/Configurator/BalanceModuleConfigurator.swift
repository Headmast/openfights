//
//  BalanceModuleConfigurator.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit

final class BalanceModuleConfigurator {

    // MARK: Internal methods

    func configure() -> BalanceViewController {
        let view = BalanceViewController()
        let presenter = BalancePresenter()
        let router = BalanceRouter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }

}
