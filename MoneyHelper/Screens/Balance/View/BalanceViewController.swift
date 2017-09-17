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
    @IBOutlet weak var tableView: UITableView!
    private var adapter: CardsListTableViewAdapter?
    var output: BalanceViewOutput!

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewLoaded()
        tableView.tableFooterView = UIView()
    }

    // MARK: - BalanceViewInput

    func setupInitialState() {

    }

    func loadItems(_ cards: [CardEntity]) {
        let adapter = CardsListTableViewAdapter(
            forTableView: tableView,
            items: cards,
            selectAction: { [weak self] card in
                //self?.presenter?.selectRegion(region: region)
            }
        )
        self.adapter = adapter
        tableView.delegate = adapter
        tableView.dataSource = adapter
        tableView.reloadData()
    }
}

extension BalanceViewController: UITableViewDelegate {

}

extension BalanceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(CardCell.self, from: indexPath)
        cell.fillCell(title: "Кредитная карта \(indexPath.row)")
        return cell
    }

}
