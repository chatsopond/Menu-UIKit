//
//  InventoryItem.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 23/3/23.
//

import Foundation

/// A struct representing an item in an inventory, along with the amount of that item
struct InventoryItem: Identifiable {
  let id: String = UUID().uuidString
  /// The item in the inventory, conforming to the `Item` protocol
  var item: any Item
  /// The amount of the item in the inventory
  var amount: Int
}
