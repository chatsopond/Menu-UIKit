//
//  ItemCollectionViewModel.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 24/3/23.
//

import Foundation

class ItemCollectionViewModel {
  /// The InventoryItem that the cell displays.
  var inventoryItem: InventoryItem
  /// The item associated with the InventoryItem.
  var item: (any Item) { inventoryItem.item }

  init(inventoryItem: InventoryItem) {
    self.inventoryItem = inventoryItem
  }
}
