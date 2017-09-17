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
        tableView.tableFooterView = UIView()
        // нет вермени писать локализацию.
        self.title = "Лучшее вклады"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor(red: 1.0, green: 124.0 / 255.0, blue: 0.0, alpha: 1.0)]
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
