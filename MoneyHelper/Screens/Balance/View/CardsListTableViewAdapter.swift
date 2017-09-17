//
//  RegionsListTableViewAdapter.swift
//  AVS-Express
//  MoneyHelper
//
//  Created by Kirill Klebanov on 17/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit

final class CardsListTableViewAdapter: NSObject {

    // MARK: Константы

    fileprivate let items: [CardEntity]
    fileprivate let selectAction: (CardEntity) -> Void

    // MARK: Инициализация и деинициализация

    init(forTableView tableView: UITableView, items: [CardEntity], selectAction: @escaping (CardEntity) -> Void) {
        self.items = items
        self.selectAction = selectAction
        tableView.registerNib(CardCell.self)
    }
}

// MARK: UITableViewDataSource

extension CardsListTableViewAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(CardCell.self, from: indexPath)
        cell.fillCell(title: "Кредитная карта \(items[indexPath.row].cardName ?? "")")
        return cell
    }

}

// MARK: UITableViewDelegate

extension CardsListTableViewAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectAction(items[indexPath.row])
    }

}
