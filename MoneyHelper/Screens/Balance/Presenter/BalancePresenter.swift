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

        MyCardService.cardsRequest {[weak self] (result) in
            if result.error != nil {
                //MessageManager.shared.showMessage(L10n.networkConnectionError)
            } else {
                print( "Cards : \(result.value)")
                if let value = result.value?.value {
                    self?.view.loadItems(value)
                }
            }
        }
    }

    // MARK: - BalanceModuleInput

}
