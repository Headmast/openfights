//
//  RecommendationsViewTests.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import XCTest
@testable import MoneyHelper

final class RecommendationsViewTests: XCTestCase {

    private var view: RecommendationsViewController?
    private var output: RecommendationsViewOutputMock?

    override func setUp() {
        super.setUp()
        view = RecommendationsViewController()
        output = RecommendationsViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        output = nil
    }

    func testThatViewNotifiesPresenterOnDidLoad() {
        // when
        self.view?.viewDidLoad()
        // then
        XCTAssert(self.output?.viewLoadedWasCalled == true)
    }

    final class RecommendationsViewOutputMock: RecommendationsViewOutput {
        var viewLoadedWasCalled: Bool = false

        func viewLoaded() {
            viewLoadedWasCalled = true
        }
    }

}
