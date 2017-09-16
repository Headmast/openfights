//
//  IntroViewController.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit

final class IntroViewController: UIViewController, IntroViewInput, ModuleTransitionable {

    // MARK: - Properties

    var output: IntroViewOutput!

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewLoaded()
    }

    // MARK: - IntroViewInput

    func setupInitialState() {

    }

}
