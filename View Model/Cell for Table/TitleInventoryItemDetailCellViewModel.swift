//
//  TitleInventoryItemDetailCellViewModel.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 30/3/23.
//

import UIKit

class TitleInventoryItemDetailCellViewModel: InventoryItemDetailCellViewModel {
  let reuseIdentifier = TitleInventoryItemDetailCell.reuseIdentifier

  func height(_ tableView: UITableView) -> CGFloat? {
    return 53
  }

  let bottomPadding: CGFloat = 6

  func heightWithBottomPadding(_ tableView: UITableView) -> CGFloat {
    return (height(tableView) ?? 0) + bottomPadding
  }

  private let inventoryItem: InventoryItem

  init(inventoryItem: InventoryItem) {
    self.inventoryItem = inventoryItem
  }

  var title: String {
    return inventoryItem.item.title
  }
}
