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
    @IBOutlet weak var tableView: UITableView!
    private var adapter: GoalsListTableViewAdapter?
    
    var output: GoalsViewOutput!

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewLoaded()
        tableView.tableFooterView = UIView()
    }

    // MARK: - GoalsViewInput

    func setupInitialState() {

    }

    func loadItems(_ goals: [GoalEntity]) {
        let adapter = GoalsListTableViewAdapter(
            forTableView: tableView,
            items: goals,
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
