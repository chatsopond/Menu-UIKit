//
//  InventoryViewModel.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 23/3/23.
//

import UIKit

/// This class represents the view model used to populate an inventory.
class InventoryViewModel {
  /// The inventory to display.
  var inventory: Inventory

  /// The inventory items to display.
  var items: [InventoryItem] {
    return inventory.inventoryItems
  }

  /// Initializes a new instance of the InventoryViewModel class.
  ///
  /// - Parameter inventory: The inventory to display.
  init(inventory: Inventory) {
    self.inventory = inventory
  }

  /// Returns the number of items in the inventory.
  ///
  /// - Returns: The number of items in the inventory.
  func numberOfItems() -> Int {
    return items.count
  }

  /// Returns the inventory item at the specified index.
  /// - Parameter index: The index of the item to return.
  /// - Returns: The inventory item at the specified index.
  func item(at index: Int) -> InventoryItem {
    return items[index]
  }

  /// Moves an inventory item from one position to another.
  ///
  /// - Parameters:
  ///   - sourceIndex: The index of the item to move.
  ///   - destinationIndex: The index to move the item to.
  func moveItem(from sourceIndex: Int, to destinationIndex: Int) {
    guard sourceIndex != destinationIndex else { return }

    let itemToMove = inventory.inventoryItems.remove(at: sourceIndex)
    inventory.inventoryItems.insert(itemToMove, at: destinationIndex)
  }
}
