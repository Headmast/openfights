//
//  GoalsPresenter.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

final class GoalsPresenter: GoalsViewOutput, GoalsModuleInput {

    // MARK: - Properties

    weak var view: GoalsViewInput!
    var router: GoalsRouterInput!

    // MARK: - GoalsViewOutput

    func viewLoaded() {
        view.setupInitialState()
    }

    // MARK: - GoalsModuleInput

}
