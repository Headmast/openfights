//
//  RegionsListTableViewAdapter.swift
//  AVS-Express
//  MoneyHelper
//
//  Created by Kirill Klebanov on 17/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit

final class DepositsListTableViewAdapter: NSObject {

    // MARK: Константы

    fileprivate let items: [DepositEntity]
    fileprivate let selectAction: (DepositEntity) -> Void

    // MARK: Инициализация и деинициализация

    init(forTableView tableView: UITableView, items: [DepositEntity], selectAction: @escaping (DepositEntity) -> Void) {
        self.items = items
        self.selectAction = selectAction
        tableView.registerNib(CardCell.self)
    }
}

// MARK: UITableViewDataSource

extension DepositsListTableViewAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(CardCell.self, from: indexPath)
        cell.fillCell(title: "Доступные депозиты \(items[indexPath.row].depositName)")
        return cell
    }

}

// MARK: UITableViewDelegate

extension DepositsListTableViewAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectAction(items[indexPath.row])
    }

}
