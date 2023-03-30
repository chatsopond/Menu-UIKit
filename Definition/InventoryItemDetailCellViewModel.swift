//
//  InventoryItemDetailCellViewModel.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 30/3/23.
//

import UIKit

protocol InventoryItemDetailCellViewModel: AnyObject {
  var reuseIdentifier: String { get }
  func height(_ tableView: UITableView) -> CGFloat?
  var bottomPadding: CGFloat { get }
  func heightWithBottomPadding(_ tableView: UITableView) -> CGFloat
}

extension InventoryItemDetailCellViewModel {
  var bottomPadding: CGFloat { 0 }
  func heightWithBottomPadding(_ tableView: UITableView) -> CGFloat {
    height(tableView) ?? CGFloat(0)
  }
}

class EmptyInventoryItemDetailCellViewModel: InventoryItemDetailCellViewModel {
  let reuseIdentifier: String = "EmptyInventoryItemDetailCell"
  func height(_ tableView: UITableView) -> CGFloat? {
    return 0
  }
}
