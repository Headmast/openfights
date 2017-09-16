//
//  RecommendationsModuleConfiguratorTests.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import XCTest
@testable import MoneyHelper

final class RecommendationsModuleConfiguratorTests: XCTestCase {

    func testConfigureScreen() {
        // when
        let viewController = RecommendationsModuleConfigurator().configure()

        // then
        XCTAssertNotNil(viewController.output, "RecommendationsViewController is nil after configuration")
        XCTAssertTrue(viewController.output is RecommendationsPresenter, "output is not RecommendationsPresenter")

        let presenter: RecommendationsPresenter = viewController.output as! RecommendationsPresenter
        XCTAssertNotNil(presenter.view, "view in RecommendationsPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in RecommendationsPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is RecommendationsRouter, "router is not RecommendationsRouter")

        let router: RecommendationsRouter = presenter.router as! RecommendationsRouter
        XCTAssertTrue(router.view is RecommendationsViewController, "view in router is not RecommendationsViewController")
    }

}
