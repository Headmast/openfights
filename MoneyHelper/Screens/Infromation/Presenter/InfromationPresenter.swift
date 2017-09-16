//
//  InfromationPresenter.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

final class InfromationPresenter: InfromationViewOutput, InfromationModuleInput {

    // MARK: - Properties

    weak var view: InfromationViewInput!
    var router: InfromationRouterInput!

    // MARK: - InfromationViewOutput

    func viewLoaded() {
        view.setupInitialState()
    }

    // MARK: - InfromationModuleInput

}
