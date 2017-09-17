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

        MyCardService.cardsRequest() { (result) in
            if result.error != nil {
                //MessageManager.shared.showMessage(L10n.networkConnectionError)
            } else {
                print( "Cards : \(result.value)")
                //self.router.openAddressView()
            }
        }
    }

    // MARK: - IntroViewInput

    func setupInitialState() {

    }

    // MARK: - IntroViewOutput
    @IBAction func moveForwardAction(_ sender: UIButton) {
        output.moveForwardAction()
    }

}
