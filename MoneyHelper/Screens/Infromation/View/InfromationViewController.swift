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
        // нет вермени писать локализацию.
        self.title = "Информация"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor(red: 1.0, green: 124.0 / 255.0, blue: 0.0, alpha: 1.0)]
    }

    // MARK: - InfromationViewInput

    func setupInitialState() {

    }

}
