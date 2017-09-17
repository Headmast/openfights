//
//  BalanceViewInput.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

protocol BalanceViewInput: class {
    /// Method for setup initial state of view
    func setupInitialState()

    func loadCards(_ cards: [CardEntity])
}
