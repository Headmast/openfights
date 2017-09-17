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

        MyCardService.depositsRequest { [weak self] (result) in
            if result.error != nil {
                //MessageManager.shared.showMessage(L10n.networkConnectionError)
            } else {
                if let value = result.value?.value {
                    self?.view.loadItems(value)
                }
            }
        }
    }

    // MARK: - RecommendationsModuleInput

}
