//
//  GoalsPresenter.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import OHHTTPStubs

final class GoalsPresenter: GoalsViewOutput, GoalsModuleInput {

    // MARK: - Properties

    weak var view: GoalsViewInput!
    var router: GoalsRouterInput!

    // MARK: - GoalsViewOutput

    func viewLoaded() {
        view.setupInitialState()

        stub(condition: isPath("/MyGoal/1.0.0/MyCardsInfo/goallist")) { _ in
            // Stub it with our "wsresponse.json" stub file (which is in same bundle as self)
            let stubPath = OHPathForFile("goals.json", type(of: self))
            return fixture(filePath: stubPath!, headers: ["Content-Type": "application/json"])
        }

        MyCardService.goalsRequest { [weak self] (result) in
            if result.error != nil {
                //MessageManager.shared.showMessage(L10n.networkConnectionError)
            } else {
                if let value = result.value?.value {
                    self?.view.loadItems(value)
                }
            }
        }
    }

    // MARK: - GoalsModuleInput

}
