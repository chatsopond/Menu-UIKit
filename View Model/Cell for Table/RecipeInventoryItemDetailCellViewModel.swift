//
//  RecipeInventoryItemDetailCellViewModel.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 30/3/23.
//

import UIKit

class RecipeInventoryItemDetailCellViewModel: InventoryItemDetailCellViewModel {
  let reuseIdentifier = RecipeInventoryItemDetailCell.reuseIdentifier

  func height(_ tableView: UITableView) -> CGFloat? {
    return 120 + 53
  }

  private let inventoryItem: InventoryItem

  init(inventoryItem: InventoryItem) {
    self.inventoryItem = inventoryItem
  }

  var recipe: [any Item] {
    // swiftlint:disable:next force_unwrapping
    inventoryItem.item.recipe!
  }
}
