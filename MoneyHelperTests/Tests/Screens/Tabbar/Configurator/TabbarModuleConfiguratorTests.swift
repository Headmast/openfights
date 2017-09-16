//
//  TabbarModuleConfiguratorTests.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import XCTest
@testable import MoneyHelper

final class TabbarModuleConfiguratorTests: XCTestCase {

    func testConfigureScreen() {
        // when
        let viewController = TabbarModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "TabbarViewController is nil after configuration")
        XCTAssertTrue(viewController.output is TabbarPresenter, "output is not TabbarPresenter")

        let presenter: TabbarPresenter = viewController.output as! TabbarPresenter
        XCTAssertNotNil(presenter.view, "view in TabbarPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in TabbarPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is TabbarRouter, "router is not TabbarRouter")

        let router: TabbarRouter = presenter.router as! TabbarRouter
        XCTAssertTrue(router.view is TabbarViewController, "view in router is not TabbarViewController")
    }

}
