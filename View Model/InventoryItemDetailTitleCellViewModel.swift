//
//  InventoryItemDetailTitleCellViewModel.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 30/3/23.
//

import Foundation

class InventoryItemDetailTitleCellViewModel {
  private let inventoryItem: InventoryItem

  init(inventoryItem: InventoryItem) {
    self.inventoryItem = inventoryItem
  }

  var title: String {
    return inventoryItem.item.title
  }
}
