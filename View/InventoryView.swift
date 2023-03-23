//
//  InventoryView.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 23/3/23.
//

import UIKit
import Anchorage

/// This class represents a custom UIView used to display an inventory.
class InventoryView: UIView {
  /// The collection view used to display the inventory items.
  let inventoryCollectionView = InventoryCollectionView()

  /// Initializes a new instance of the InventoryView class.
  override init(frame: CGRect) {
    super.init(frame: .zero)
    setupViews()
  }

  /// Initializes a new instance of the InventoryView class.
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  /// Sets up the subviews of the view.
  private func setupViews() {
    addSubview(inventoryCollectionView)
    inventoryCollectionView.edgeAnchors == edgeAnchors
  }
}
