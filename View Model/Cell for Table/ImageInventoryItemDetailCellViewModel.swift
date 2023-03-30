//
//  ImageInventoryItemDetailCellViewModel.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 30/3/23.
//

import UIKit

class ImageInventoryItemDetailCellViewModel: InventoryItemDetailCellViewModel {
  let reuseIdentifier = ImageInventoryItemDetailCell.reuseIdentifier

  func height(_ tableView: UITableView) -> CGFloat? {
    return tableView.frame.width
  }

  private let inventoryItem: InventoryItem

  init(inventoryItem: InventoryItem) {
    self.inventoryItem = inventoryItem
  }

  var imageName: String {
    inventoryItem.item.imageName
  }

  var backgroundImage: UIImage {
    inventoryItem.item.backgroundCrispImage
  }
}
