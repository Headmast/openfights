//
//  RecommendationsPresenter.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

final class RecommendationsPresenter: RecommendationsViewOutput, RecommendationsModuleInput {

    // MARK: - Properties

    weak var view: RecommendationsViewInput!
    var router: RecommendationsRouterInput!

    // MARK: - RecommendationsViewOutput

    func viewLoaded() {
        view.setupInitialState()
    }

    // MARK: - RecommendationsModuleInput

}
