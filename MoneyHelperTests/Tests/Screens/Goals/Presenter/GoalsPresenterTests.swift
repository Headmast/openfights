//
//  GoalsPresenterTests.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import XCTest
@testable import MoneyHelper

final class GoalsPresenterTest: XCTestCase {

    private var presenter: GoalsPresenter = GoalsPresenter()
    private var view: MockViewController = MockViewController()

    override func setUp() {
        super.setUp()
        presenter = GoalsPresenter()
        presenter.router = MockRouter()
        view = MockViewController()
        presenter.view = view
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testThatPresenterHandlesViewLoadedEvent() {
        // when 
        presenter.viewLoaded()
        // then
        XCTAssertTrue((presenter.view as! MockViewController).setupInitialStateWasCalled)
    }

    final class MockRouter: GoalsRouterInput {
    }

    final class MockViewController: GoalsViewInput {
        var setupInitialStateWasCalled: Bool = false

        func setupInitialState() {
            setupInitialStateWasCalled = true
        }
    }

}
