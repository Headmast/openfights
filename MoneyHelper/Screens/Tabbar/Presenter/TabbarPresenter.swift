//
//  TabbarPresenter.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

final class TabbarPresenter: TabbarViewOutput, TabbarModuleInput {

    // MARK: - Properties

    weak var view: TabbarViewInput!
    var router: TabbarRouterInput!

    // MARK: - TabbarViewOutput

    func viewLoaded() {
        view.setupInitialState()
    }

    // MARK: - TabbarModuleInput

}
