//
//  BalanceViewController.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit

final class BalanceViewController: UIViewController, BalanceViewInput, ModuleTransitionable {

    // MARK: - Properties

    var output: BalanceViewOutput!

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewLoaded()
    }

    // MARK: - BalanceViewInput

    func setupInitialState() {

    }

}
