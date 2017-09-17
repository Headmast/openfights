//
//  InfromationPresenterTests.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import XCTest
@testable import MoneyHelper

final class InfromationPresenterTest: XCTestCase {

    private var presenter: InfromationPresenter = InfromationPresenter()
    private var view: MockViewController = MockViewController()

    override func setUp() {
        super.setUp()
        presenter = InfromationPresenter()
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

    final class MockRouter: InfromationRouterInput {
    }

    final class MockViewController: InfromationViewInput {
        var setupInitialStateWasCalled: Bool = false

        func setupInitialState() {
            setupInitialStateWasCalled = true
        }
    }

}
