//
//  InfromationModuleConfiguratorTests.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import XCTest
@testable import MoneyHelper

final class InfromationModuleConfiguratorTests: XCTestCase {

    func testConfigureScreen() {
        // when
        let viewController = InfromationModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "InfromationViewController is nil after configuration")
        XCTAssertTrue(viewController.output is InfromationPresenter, "output is not InfromationPresenter")

        let presenter: InfromationPresenter = viewController.output as! InfromationPresenter
        XCTAssertNotNil(presenter.view, "view in InfromationPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in InfromationPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is InfromationRouter, "router is not InfromationRouter")

        let router: InfromationRouter = presenter.router as! InfromationRouter
        XCTAssertTrue(router.view is InfromationViewController, "view in router is not InfromationViewController")
    }

}
