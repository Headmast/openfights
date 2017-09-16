//
//  IntroViewTests.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import XCTest
@testable import MoneyHelper

final class IntroViewTests: XCTestCase {

    private var view: IntroViewController?
    private var output: IntroViewOutputMock?

    override func setUp() {
        super.setUp()
        view = IntroViewController()
        output = IntroViewOutputMock()
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

    final class IntroViewOutputMock: IntroViewOutput {
        var viewLoadedWasCalled: Bool = false

        func viewLoaded() {
            viewLoadedWasCalled = true
        }
    }

}
