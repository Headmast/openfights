//
//  IntroPresenter.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

final class IntroPresenter: IntroViewOutput, IntroModuleInput {

    // MARK: - Properties

    weak var view: IntroViewInput!
    var router: IntroRouterInput!

    // MARK: - IntroViewOutput

    func viewLoaded() {
        view.setupInitialState()
    }

    // MARK: - IntroModuleInput
    func moveForwardAction() {
        self.router.showMainScreen()
    }
}
