//
//  TabbarViewController.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit

final class TabbarViewController: UITabBarController, TabbarViewInput, ModuleTransitionable {

    // MARK: - Properties

    var output: TabbarViewOutput!

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    // MARK: - TabbarViewInput

    func setupInitialState() {

    }

}
