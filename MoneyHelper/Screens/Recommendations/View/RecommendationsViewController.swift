//
//  RecommendationsViewController.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit

final class RecommendationsViewController: UIViewController, RecommendationsViewInput, ModuleTransitionable {

    // MARK: - Properties

    var output: RecommendationsViewOutput!

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewLoaded()
    }

    // MARK: - RecommendationsViewInput

    func setupInitialState() {

    }

}
