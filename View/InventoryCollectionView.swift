//
//  InventoryCollectionView.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 22/3/23.
//

import UIKit
import Anchorage

/// A custom `UICollectionView` subclass for displaying an inventory of items
class InventoryCollectionView: UICollectionView {
  /// The layout for the collection view
  private let inventoryLayout: UICollectionViewFlowLayout = {
    let layout = TopAlignedCollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    return layout
  }()

  /// Initializes a new `InventoryCollectionView` with the default layout
  init() {
    super.init(frame: .zero, collectionViewLayout: inventoryLayout)
    setupViews()
  }

  /// Not implemented
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  /// Configures the initial view hierarchy and settings
  private func setupViews() {
    // Set the background color to transparent
    backgroundColor = UIColor(white: 1.0, alpha: 0.01)

    // Always bounce vertically
    alwaysBounceVertical = true

    // Register the cell class for reuse
    register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.reuseIdentifier)

    // Set up constraints using Anchorage
    heightAnchor >= 0
    widthAnchor >= 0
  }
}
