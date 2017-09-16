//
//  BalanceModuleConfiguratorTests.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import XCTest
@testable import MoneyHelper

final class BalanceModuleConfiguratorTests: XCTestCase {

    func testConfigureScreen() {
        // when
        let viewController = BalanceModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "BalanceViewController is nil after configuration")
        XCTAssertTrue(viewController.output is BalancePresenter, "output is not BalancePresenter")

        let presenter: BalancePresenter = viewController.output as! BalancePresenter
        XCTAssertNotNil(presenter.view, "view in BalancePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in BalancePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is BalanceRouter, "router is not BalanceRouter")

        let router: BalanceRouter = presenter.router as! BalanceRouter
        XCTAssertTrue(router.view is BalanceViewController, "view in router is not BalanceViewController")
    }

}
