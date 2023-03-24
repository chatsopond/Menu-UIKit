//
//  ItemCollectionViewModel.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 24/3/23.
//

import Foundation

class ItemCollectionViewModel: Identifiable {
  let id = UUID()
  /// The InventoryItem that the cell displays.
  var inventoryItem: InventoryItem
  /// The item associated with the InventoryItem.
  var item: (any Item) { inventoryItem.item }

  var isShowDetail = false

  init(inventoryItem: InventoryItem) {
    self.inventoryItem = inventoryItem
  }
}

extension ItemCollectionViewModel: Equatable {
  static func == (lhs: ItemCollectionViewModel, rhs: ItemCollectionViewModel) -> Bool {
    return lhs.id == rhs.id
  }
}
