//
//  GoalsViewController.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit

final class GoalsViewController: UIViewController, GoalsViewInput, ModuleTransitionable {

    // MARK: - Properties

    var output: GoalsViewOutput!

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewLoaded()
    }

    // MARK: - GoalsViewInput

    func setupInitialState() {

    }

}
