//
//  InventoryViewController.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 22/3/23.
//
// swiftlint:disable: force_cast

import UIKit
import Anchorage

class InventoryViewController: UIViewController {
  private let inventoryCollectionView = InventoryCollectionView()
  private let gradientFlowViewController = GradientFlowUIViewController()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }

  private func setupViews() {
    view.addSubview(inventoryCollectionView)
    inventoryCollectionView.dataSource = self
    inventoryCollectionView.delegate = self

    // Add gradientFlowViewController's view as a subview
    view.addSubview(gradientFlowViewController.view)

    // Set up constraints using Anchorage
    inventoryCollectionView.edgeAnchors == view.safeAreaLayoutGuide.edgeAnchors
    inventoryCollectionView.edgeAnchors == view.safeAreaLayoutGuide.edgeAnchors

    // Bring gradientFlowViewController's view to the back
    view.sendSubviewToBack(gradientFlowViewController.view)
  }
}

// MARK: - UICollectionViewDataSource

extension InventoryViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1 // Replace with the desired number of items
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: ItemCollectionViewCell.reuseIdentifier,
      for: indexPath) as! ItemCollectionViewCell
    cell.inventoryItem = InventoryItem(item: AppleItem(), amount: 1)
    // Configure the cell here
    return cell
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension InventoryViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 112, height: 136)
  }
}
