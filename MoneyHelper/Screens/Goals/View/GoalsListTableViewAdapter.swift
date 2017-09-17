//
//  RegionsListTableViewAdapter.swift
//  AVS-Express
//  MoneyHelper
//
//  Created by Kirill Klebanov on 17/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit

final class GoalsListTableViewAdapter: NSObject {

    // MARK: Константы

    fileprivate let items: [GoalEntity]
    fileprivate let selectAction: (GoalEntity) -> Void

    // MARK: Инициализация и деинициализация

    init(forTableView tableView: UITableView, items: [GoalEntity], selectAction: @escaping (GoalEntity) -> Void) {
        self.items = items
        self.selectAction = selectAction
        tableView.registerNib(CardCell.self)
    }
}

// MARK: UITableViewDataSource

extension GoalsListTableViewAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(CardCell.self, from: indexPath)
        cell.fillCell(title: "\(items[indexPath.row].goalName ?? "")")
        return cell
    }

}

// MARK: UITableViewDelegate

extension GoalsListTableViewAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectAction(items[indexPath.row])
    }

}
