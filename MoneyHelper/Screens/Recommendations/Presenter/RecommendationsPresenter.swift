//
//  RecommendationsPresenter.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import OHHTTPStubs

final class RecommendationsPresenter: RecommendationsViewOutput, RecommendationsModuleInput {

    // MARK: - Properties

    weak var view: RecommendationsViewInput!
    var router: RecommendationsRouterInput!

    // MARK: - RecommendationsViewOutput

    func viewLoaded() {
        view.setupInitialState()

        stub(condition: isPath("/getdepositinfo/1.0.0/Deposits/info")) { _ in
            // Stub it with our "wsresponse.json" stub file (which is in same bundle as self)
            let stubPath = OHPathForFile("depo.json", type(of: self))
            return fixture(filePath: stubPath!, headers: ["Content-Type": "application/json"])
        }

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
