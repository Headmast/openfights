//
//  IntroModuleConfiguratorTests.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import XCTest
@testable import MoneyHelper

final class IntroModuleConfiguratorTests: XCTestCase {

    func testConfigureScreen() {
        // when
        let viewController = IntroModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "IntroViewController is nil after configuration")
        XCTAssertTrue(viewController.output is IntroPresenter, "output is not IntroPresenter")

//        let presenter: IntroPresenter = viewController.output as! IntroPresenter
//        XCTAssertNotNil(presenter.view, "view in IntroPresenter is nil after configuration")
//        XCTAssertNotNil(presenter.router, "router in IntroPresenter is nil after configuration")
//        XCTAssertTrue(presenter.router is IntroRouter, "router is not IntroRouter")
//
//        let router: IntroRouter = presenter.router as! IntroRouter
//        XCTAssertTrue(router.view is IntroViewController, "view in router is not IntroViewController")
    }

}
