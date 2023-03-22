//
//  InventoryViewController.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 22/3/23.
//

import UIKit
import Anchorage

class InventoryViewController: UIViewController {

  private let inventoryCollectionView = InventoryCollectionView()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }

  private func setupViews() {
    view.backgroundColor = .white
    view.addSubview(inventoryCollectionView)
    inventoryCollectionView.dataSource = self
    inventoryCollectionView.delegate = self

    // Set up constraints using Anchorage
    inventoryCollectionView.edgeAnchors == view.safeAreaLayoutGuide.edgeAnchors
  }
}

// MARK: - UICollectionViewDataSource

extension InventoryViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1 // Replace with the desired number of items
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.reuseIdentifier, for: indexPath) as! ItemCollectionViewCell
    // Configure the cell here
    return cell
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension InventoryViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.bounds.width / 2 - 10, height: collectionView.bounds.width / 2 - 10)
  }
}
