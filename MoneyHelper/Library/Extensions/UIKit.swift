//
//  UIKit.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit

// MARK: - UITableView

extension UITableView {
    var isNeedFillFreeSpace: Bool {
        set { self.tableFooterView = newValue ? nil : UIView() }
        get { return self.tableFooterView == nil }
    }

    func register<Cell: UITableViewCell>(_ type: Cell.Type) {
        register(type, forCellReuseIdentifier: type.nameOfClass)
    }

    func registerNib(_ cellType: UITableViewCell.Type) {
        register(UINib(nibName: cellType.nameOfClass, bundle: nil), forCellReuseIdentifier: cellType.nameOfClass)
    }

    func register<HeaderFooter: UITableViewHeaderFooterView>(headerFooter type: HeaderFooter.Type) {
        register(type, forHeaderFooterViewReuseIdentifier: type.nameOfClass)
    }

    func registerNib<HeaderFooter: UITableViewHeaderFooterView>(headerFooter type: HeaderFooter.Type) {
        register(UINib(nibName: type.nameOfClass, bundle: nil), forHeaderFooterViewReuseIdentifier: type.nameOfClass)
    }

    func dequeue<HeaderFooter: UITableViewHeaderFooterView>(_ headerFooter: HeaderFooter.Type) -> HeaderFooter {
        return dequeueReusableHeaderFooterView(withIdentifier: headerFooter.nameOfClass) as! HeaderFooter
    }

    func dequeue<Cell: UITableViewCell>(_ cell: Cell.Type, from indexPath: IndexPath) -> Cell {
        return dequeueReusableCell(withIdentifier: Cell.nameOfClass, for: indexPath) as! Cell
    }

    func dequeue<Cell: UITableViewCell>(_ cell: Cell.Type, from row: Int) -> Cell {
        return dequeue(cell, from: IndexPath(row: row, section: 0))
    }
}
