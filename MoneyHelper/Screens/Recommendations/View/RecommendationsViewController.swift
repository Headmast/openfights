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
    @IBOutlet weak var tableView: UITableView!
    private var adapter: DepositsListTableViewAdapter?

    var output: RecommendationsViewOutput!

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewLoaded()
    }

    // MARK: - RecommendationsViewInput

    func setupInitialState() {

    }

    func loadItems(_ deposits: [DepositEntity]) {
        let adapter = DepositsListTableViewAdapter(
            forTableView: tableView,
            items: deposits,
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
