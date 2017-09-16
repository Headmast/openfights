//
//  BalancePresenter.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

final class BalancePresenter: BalanceViewOutput, BalanceModuleInput {

    // MARK: - Properties

    weak var view: BalanceViewInput!
    var router: BalanceRouterInput!

    // MARK: - BalanceViewOutput

    func viewLoaded() {
        view.setupInitialState()
    }

    // MARK: - BalanceModuleInput

}
