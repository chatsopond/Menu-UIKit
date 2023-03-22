//
//  InventoryCollectionView.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 22/3/23.
//

import UIKit
import Anchorage

class InventoryCollectionView: UICollectionView {
  private let inventoryLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    return layout
  }()

  init() {
    super.init(frame: .zero, collectionViewLayout: inventoryLayout)
    setupViews()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViews() {
    backgroundColor = .clear
    alwaysBounceVertical = true

    register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.reuseIdentifier)

    // Set up constraints using Anchorage
    heightAnchor >= 0
    widthAnchor >= 0
  }
}
