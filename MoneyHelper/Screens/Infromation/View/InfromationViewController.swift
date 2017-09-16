//
//  InfromationViewController.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit

final class InfromationViewController: UIViewController, InfromationViewInput, ModuleTransitionable {

    // MARK: - Properties

    var output: InfromationViewOutput!

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewLoaded()
    }

    // MARK: - InfromationViewInput

    func setupInitialState() {

    }

}
