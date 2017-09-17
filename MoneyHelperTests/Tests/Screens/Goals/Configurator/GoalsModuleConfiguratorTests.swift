//
//  GoalsModuleConfiguratorTests.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import XCTest
@testable import MoneyHelper

final class GoalsModuleConfiguratorTests: XCTestCase {

    func testConfigureScreen() {
        // when
        let viewController = GoalsModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "GoalsViewController is nil after configuration")
        XCTAssertTrue(viewController.output is GoalsPresenter, "output is not GoalsPresenter")

        let presenter: GoalsPresenter = viewController.output as! GoalsPresenter
        XCTAssertNotNil(presenter.view, "view in GoalsPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in GoalsPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is GoalsRouter, "router is not GoalsRouter")

        let router: GoalsRouter = presenter.router as! GoalsRouter
        XCTAssertTrue(router.view is GoalsViewController, "view in router is not GoalsViewController")
    }

}
