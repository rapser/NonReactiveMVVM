//
//  CellRepresentable.swift
//  NonReactiveMVVM
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import UIKit

protocol CellRepresentable {
    static func registerCell(tableView: UITableView)
    func dequeueCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func cellSelected()
}
