//
//  InventoryViewController.swift
//  Menu UIKit
//
//  Created by Chatsopon Deepateep on 22/3/23.
//
// swiftlint:disable: force_cast

import UIKit
import Anchorage

/// This class represents a UIViewController used to display an inventory.
class InventoryViewController: UIViewController {
  /// The view used to display the inventory.
  private let inventoryView: InventoryView

  /// The view model used to populate the inventory.
  private let viewModel: InventoryViewModel

  /// Initializes a new instance of the InventoryViewController class.
  ///
  /// - Parameter viewModel: The view model to use.
  init(viewModel: InventoryViewModel) {
    self.viewModel = viewModel
    self.inventoryView = InventoryView()
    super.init(nibName: nil, bundle: nil)
  }

  /// Initializes a new instance of the InventoryViewController class.
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  /// Called after the controller's view is loaded into memory.
  override func viewDidLoad() {
    super.viewDidLoad()
    view = inventoryView
    inventoryView.inventoryCollectionView.dataSource = self
    inventoryView.inventoryCollectionView.delegate = self
    inventoryView.inventoryCollectionView.dragInteractionEnabled = true
    inventoryView.inventoryCollectionView.dragDelegate = self
    inventoryView.inventoryCollectionView.dropDelegate = self
  }
}

// MARK: - UICollectionViewDataSource

extension InventoryViewController: UICollectionViewDataSource {
  /// Asks your data source object to provide the number of items in the specified section.
  /// - Parameter collectionView: The collection view requesting this information.
  /// - Parameter section: An index number identifying a section in collectionView.
  /// - Returns: The number of rows in section.
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.numberOfItems()
  }

  /// Asks your data source object for the cell that corresponds to the specified item in the collection view.
  /// - Parameter collectionView: The collection view requesting this information.
  /// - Parameter indexPath: The index path that specifies the location of the item.
  /// - Returns: A configured cell object. You must not return nil from this method.
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: ItemCollectionViewCell.reuseIdentifier,
      for: indexPath) as! ItemCollectionViewCell
    cell.inventoryItem = viewModel.item(at: indexPath.row)
    return cell
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension InventoryViewController: UICollectionViewDelegateFlowLayout {
  /// Asks the delegate for the size of the specified item’s cell.
  /// - Parameter collectionView: The collection view object displaying the flow layout.
  /// - Parameter collectionViewLayout: The layout object requesting the information.
  /// - Parameter indexPath: The index path of the item.
  /// - Returns: The width and height of the specified item. Both values must be greater than 0.
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 112, height: 136)
  }
}


// MARK: - Drag & Drop

extension InventoryViewController: UICollectionViewDragDelegate, UICollectionViewDropDelegate {
  func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
    let item = viewModel.item(at: indexPath.row)
    let itemProvider = NSItemProvider(object: item.id as NSString)
    let dragItem = UIDragItem(itemProvider: itemProvider)
    dragItem.localObject = item
    return [dragItem]
  }

  func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
    guard let destinationIndexPath = coordinator.destinationIndexPath else { return }
    if let item = coordinator.items.first, let sourceIndexPath = item.sourceIndexPath {
      collectionView.performBatchUpdates({
        viewModel.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        collectionView.moveItem(at: sourceIndexPath, to: destinationIndexPath)
      }, completion: nil)
      coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
    }
  }

  func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool {
    return session.canLoadObjects(ofClass: NSString.self)
  }

  func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
    if collectionView.hasActiveDrag {
      return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
    }
    return UICollectionViewDropProposal(operation: .forbidden)
  }
}
