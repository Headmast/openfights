//
//  RecommendationsModuleConfigurator.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit

final class RecommendationsModuleConfigurator {

    // MARK: Internal methods

    func configure() -> RecommendationsViewController {
        let view = RecommendationsViewController()
        let presenter = RecommendationsPresenter()
        let router = RecommendationsRouter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }

}
